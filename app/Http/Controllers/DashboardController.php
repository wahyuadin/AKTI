<?php

namespace App\Http\Controllers;

use App\Models\Absensi;
use App\Models\Departement;
use App\Models\Logbook;
use App\Models\Mahasiswa;
use App\Models\Mentor;
use App\Models\PengajuanMentor;
use App\Models\Section;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use RealRashid\SweetAlert\Facades\Alert;

class DashboardController extends Controller
{
    protected $mentor;
    protected $mahasiswa;
    protected $user;
    protected $section;
    protected $departement;
    protected $logbook;
    public function __construct(Mentor $mentor, Mahasiswa $mahasiswa, User $user, Section $section, Logbook $logbook, Departement $departement)
    {
        $this->mentor       = $mentor;
        $this->mahasiswa    = $mahasiswa;
        $this->user         = $user;
        $this->section      = $section;
        $this->logbook      = $logbook;
        $this->departement  = $departement;
    }

    // Mahasiswa
    // DASHBOARD
    public function donat_absensi_mahasiswa() {
    date_default_timezone_set('Asia/Jakarta');
    $bulan          = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
    $nama_bulan     = $bulan[date("n") - 1];
    $absen          = Absensi::whereBetween('filter', [date('m'), date('m')])->get();

    $izinCount          = Absensi::where('keterangan', 'izin')->count();
    $hadirCount         = Absensi::where('keterangan', 'hadir')->count();
    $tidakHadirCount    = Absensi::where('keterangan', 'tidak hadir')->count();

    foreach ($absen as $data) {
        if ($data->keterangan == 'izin') {
            $izinCount++;
        } elseif ($data->keterangan == 'hadir') {
            $hadirCount++;
        } elseif ($data->keterangan == 'tidak hadir') {
            $tidakHadirCount++;
        }
    }

    $label      = [];
    $values     = [];
    if ($hadirCount > 0) {
        $label[] = 'Hadir';
        $values[] = $hadirCount;
    }
    if ($tidakHadirCount > 0) {
        $label[] = 'Tidak Hadir';
        $values[] = $tidakHadirCount;
    }
    if ($izinCount > 0) {
        $label[] = 'Izin';
        $values[] = $izinCount;
    }

    return ['label' => $label, 'value' => $values, 'bulan' => $nama_bulan.', '.date("Y")];

    }

    public function chart_logbook_mahasiswa(){
        date_default_timezone_set('Asia/Jakarta');
        $startDate = Carbon::now()->startOfMonth()->timezone('Asia/Jakarta');
        $endDate = Carbon::now()->endOfMonth()->timezone('Asia/Jakarta');
        while ($startDate->lt($endDate)) {
            $endDateOfWeek  = $startDate->copy()->addDays(6)->endOfDay();
            $pendingCount[] = Logbook::whereBetween('updated_at', [$startDate, $endDateOfWeek])
                                    ->where('status', 'pending')
                                    ->count();
            $rejectCount[] = Logbook::whereBetween('updated_at', [$startDate, $endDateOfWeek])
                                    ->where('status', 'reject')
                                    ->count();
            $acceptCount[] = Logbook::whereBetween('updated_at', [$startDate, $endDateOfWeek])
                                    ->where('status', 'accept')
                                    ->count();
            $startDate->addDays(7)->startOfWeek();
        }

        return ['pending' => $pendingCount, 'reject' => $rejectCount, 'accept' => $acceptCount];
    }
    // END DASHBOARD
    public function mahasiswa() {
        return view('mahasiswa.dashboard', [
            'donat' => $this->donat_absensi_mahasiswa(),
            'chart' => $this->chart_logbook_mahasiswa(),
            'date'  => Absensi::tanggal()
        ]);
    }

    public function mahasiswaProfile(){
        return view('mahasiswa.profile', [
            'data'              => $this->mahasiswa->show(),
            'faker'             => Faker::create(),
            'mentor'            => $this->mentor->showAll(),
            'pengajuan_mentor'  => PengajuanMentor::show_by_id_mahasiswa()
        ]);
    }

    public function mahasiswaProfileEdit(Request $request, $id) {
        $this->validate($request, [
            'nama'          => 'required|max:60',
            'password_lama' => 'nullable|max:60',
            'password'      => 'nullable|max:60',
            'repassword'    => 'nullable|max:60|same:password',
            'alamat'        => 'required|max:60',
            'foto_profile'  => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ], [
            'foto_profile.image'    => 'Kolom foto profil harus berupa gambar.',
            'foto_profile.mimes'    => 'Format gambar yang diterima adalah jpeg, png, jpg, gif, atau svg.',
            'foto_profile.max'      => 'Ukuran gambar tidak boleh melebihi 2048 kilobit (2MB).',
            'repassword.same'       => 'Konfirmasi password tidak cocok dengan password baru.'
        ]);

        if ($request->filled('password')) {
            if (!Hash::check($request->password_lama, Auth::user()->password)) {
                return redirect()->back()->withErrors('Password lama tidak sesuai.');
            }
        }

        if ($request->filled('password')) {
            Auth::user()->password = Hash::make($request->password);
        }

        $user = User::find($id);
        $user->nama = $request->nama;
        $user->alamat = $request->alamat;

        if ($request->hasFile('foto_profile')) {
            $existingData = User::find(Auth::user()->id);
            if ($existingData && $existingData->foto_profile) {
                $previousFilePath = public_path('assets/img/profile/') . $existingData->foto_profile;
                if (file_exists($previousFilePath)) {
                    unlink($previousFilePath);
                }
            }

            $file = $request->file('foto_profile');
            $fileName = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('assets/img/profile/'), $fileName);
            $user->foto_profile = $fileName;
        }
        if ($user->save()) {
            Alert::success('Berhasil', 'Profile berhasil diupdate!');
        } else {
            Alert::error('Gagal', 'Gagal mengupdate profile.');
        }

        return redirect()->back();
    }

    public function pengajuanMentor(Request $request) {
        $this->validate($request, [
            'mentor_pertama'    => 'required',
            'mentor_kedua'      => 'required',
        ]);
        $data = $request->all();
        $data['mahasiswa_id'] = Mahasiswa::where('user_id', Auth::user()->id)->value('id');
        if (PengajuanMentor::post($data)) {
            Alert::success('Berhasil', 'Pengajuan mentor berhasil dikirim!');
            return redirect()->back();
        }
    }


    // mentor
    // dashboard
    public function donat_logbook_mentor() {
        $pending    = $this->logbook->count_logbook_mentor('pending');
        $reject     = $this->logbook->count_logbook_mentor('reject');
        $accept     = $this->logbook->count_logbook_mentor('accept');
        $labels     = [];
        $data       = [];

        if ($pending > 0) {
            $labels[] = 'Pending';
            $data[] = $pending;
        }
        if ($reject > 0) {
            $labels[] = 'Reject';
            $data[] = $reject;
        }
        if ($accept > 0) {
            $labels[] = 'Accept';
            $data[] = $accept;
        }

        return [
            'label' => $labels,
            'data' => $data
        ];
    }

    public function absensiChartByWeek() {
        date_default_timezone_set('Asia/Jakarta');
        $hadir      = [0, 0, 0, 0];
        $tidakHadir = [0, 0, 0, 0];
        $izin       = [0, 0, 0, 0];
        $year       = date('Y');
        $month      = date('m');

        $absensiData = Absensi::selectRaw('CEIL(DAY(created_at) / 7) as week, keterangan, COUNT(*) as count')
            ->whereYear('created_at', $year)
            ->whereMonth('created_at', $month)
            ->groupBy(DB::raw('CEIL(DAY(created_at) / 7)'), 'keterangan')
            ->get();

        foreach ($absensiData as $data) {
            switch ($data->keterangan) {
                case 'hadir':
                    $hadir[$data->week - 1] = $data->count;
                    break;
                case 'tidak hadir':
                    $tidakHadir[$data->week - 1] = $data->count;
                    break;
                case 'izin':
                    $izin[$data->week - 1] = $data->count;
                    break;
            }
        }

        return ['hadir' => $hadir,'tidak_hadir' => $tidakHadir,'izin' => $izin];
    }

    // end dashboard
    public function mentor() {
        return view('mentor.dashboard', [
            'data'              => $this->mentor->show(),
            'list_mahasiswa'    => $this->mahasiswa->list_mahasiswa_limit(5),
            'donat'             => $this->donat_logbook_mentor(),
            'chart'             => $this->absensiChartByWeek()
        ]);
    }

    public function mentorProfile() {
        return view('mentor.profile', [
            'faker'     => Faker::create(),
            'data'      => $this->mentor->show(),
            'section'   => $this->section->tampil()
        ]);
    }

    public function mentorProfileEdit(Request $request, $id) {
        $this->validate($request, [
            'nama'          => 'required|max:60',
            'password_lama' => 'nullable|max:60',
            'password'      => 'nullable|max:60',
            'repassword'    => 'nullable|max:60|same:password',
            'no_telp'       => 'required|max:60',
            'leader'        => 'nullable|max:60',
            'alamat'        => 'required|max:255',
            'foto_profile'  => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ], [
            'foto_profile.image'    => 'Kolom foto profil harus berupa gambar.',
            'foto_profile.mimes'    => 'Format gambar yang diterima adalah jpeg, png, jpg, gif, atau svg.',
            'foto_profile.max'      => 'Ukuran gambar tidak boleh melebihi 2048 kilobit (2MB).',
            'repassword.same'       => 'Konfirmasi password tidak cocok dengan password baru.'
        ]);

        if ($request->filled('password')) {
            if (!Hash::check($request->password_lama, Auth::user()->password)) {
                return redirect()->back()->withErrors('Password lama tidak sesuai.');
            }
        }
        if ($request->filled('password')) {
            Auth::user()->password = Hash::make($request->password);
        }

        if ($request->filled('leader')) {
            $this->mentor->put($id, $request->only('leader'));
            Alert::success('Berhasil', 'Profile berhasil diupdate!');
        }
        $user = User::find($this->mentor->show()->value('user_id'));
        $user->nama = $request->nama;
        $user->alamat = $request->alamat;

        if ($request->hasFile('foto_profile')) {
            $file = $request->file('foto_profile');
            $fileName = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('assets/img/profile/'), $fileName);
            $user->foto_profile = $fileName;
        }

        Alert::success('Berhasil', 'Profile berhasil diupdate!');
        $user->save();

        return redirect()->back();

    }

    public function mentorProfile_leaderPost(Request $request) {
        $this->validate($request, [
            'leader'        => 'required|max:60',
            'section_id'    => 'required|max:60',
            'no_telp'       => 'required|max:15',
        ], [
            'leader.required'   => 'Kolom leader wajib diisi.',
            'leader.max'        => 'Kolom leader tidak boleh melebihi 50 karakter.',
            'section.required'  => 'Kolom section wajib diisi.',
            'section.max'       => 'Kolom section tidak boleh melebihi 50 karakter.',
            'no_telp.required'  => 'Kolom No Telp wajib diisi.',
            'no_telp.max'       => 'Kolom No Telp tidak boleh melebihi 12 karakter.'
        ]);
        $data                   = $request->all();
        $data['user_id']        = Auth::user()->id;
        $this->mentor->post($data);
        Alert::success('Berhasil', 'Data berhasil ditambahkan!');
        return redirect(route('dashboard.mentor'));
    }

    public function sectionProfileEdit(Request $request,$id) {
        $this->validate($request, [
            'section_id' => 'required'
        ]);
        $this->mentor->Ubah($id, ['section_id' => $request->section_id]);
        Alert::success('Berhasil', 'Section berhasil di update!');
        return redirect()->back();
    }

    // End Mentor
    // ==========
    // Section
    public function section() {
        return view('section.dashboard', [
            'data'   => $this->section->show_by_id()
        ]);
    }

    public function profileSection() {
        return view('section.profile', [
            'data'          => $this->section->show_by_id(),
            'departement'   => $this->departement->Tampil(),
            'faker'         => Faker::create()
        ]);
    }

    public function profileSection_departementPost(Request $request) {
        $this->validate($request, [
            'departement_id'    => 'required',
            'section'           => 'required'
        ],[
            'departement_id.required'   => 'Departement Harus diisi',
            'section.required'          => 'Section Harus diisi'
        ]);

        $data = $request->all();
        $data['user_id'] = Auth::user()->id;
        if ($this->section->Tambah($data)) {
            Alert::success('Berhasil', 'Data Berhasil Ditambah!');
            return redirect()->back();
        }
    }
}
