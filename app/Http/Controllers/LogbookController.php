<?php

namespace App\Http\Controllers;

use App\Models\Absensi;
use App\Models\Dosen;
use App\Models\Logbook;
use App\Models\Mahasiswa;
use App\Models\Mentor;
use App\Models\Paraf;
use App\Models\PengajuanMentor;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use RealRashid\SweetAlert\Facades\Alert;
use Faker\Factory as Faker;
use Barryvdh\DomPDF\Facade\Pdf;

class LogbookController extends Controller
{
    protected $logbook;
    protected $mahasiswa;
    protected $user;
    protected $mentor;
    protected $dosen;
    protected $absensi;
    public function __construct(Logbook $logbook, Mahasiswa $mahasiswa, User $user, Mentor $mentor, Dosen $dosen, Absensi $absensi)
    {
        $this->logbook      = $logbook;
        $this->mahasiswa    = $mahasiswa;
        $this->user         = $user;
        $this->mentor       = $mentor;
        $this->dosen        = $dosen;
        $this->absensi      = $absensi;
    }

    // MAHASISWA
    // LOGBOOK MINGGUAN
    public function weekly()
    {
        return view('mahasiswa.logbook.logbook', [
            'logbook'   => $this->logbook->show_by_id(),
            'mahasiswa' => $this->mahasiswa->show(),
            'mentor'    => Mentor::all(),
            'week'      => Mahasiswa::week(),
            'mounth'    => Mahasiswa::mounth(),
            'no'        => 1,
            'dosen'     => $this->dosen->Tampil()
        ]);
    }

    public function weekly_add_mentor(Request $request)
    {
        Validator::make($request->all(), [
            'dosen_id'      => 'required',
            'mentor_id'     => 'required',
            'noreg_vokasi'  => 'required|numeric',
            'batch'         => 'required|numeric',
            'divisi'        => 'required',
            'shop'          => 'required',
            'line'          => 'required',
            'pos'           => 'required',
            'shift'         => 'required',
        ], [
            'required'      => 'Kolom :attribute harus diisi.',
        ]);

        $data = $request->all();
        $data['user_id'] = Auth::user()->id;
        if ($this->mahasiswa->post($data)) {
            Alert::success('success', 'Data Berhasil Di Tambahkan!');
            return redirect()->back();
        }
    }

    public function weekly_add(Request $request)
    {
        $this->validate($request, [
            'self_evaluation'   => 'required',
            'keterangan'        => 'required',
            'gambar'            => 'image|max:3072',
        ]);
        $data = $request->all();
        $data['mahasiswa_id']        = $this->mahasiswa->show()->value('id');
        if ($request->hasFile('gambar')) {
            $file = $request->file('gambar');
            $fileName = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('assets/img/logbook/'), $fileName);
            $data['gambar'] = $fileName;
        }

        $this->logbook->post($data);
        Alert::success('success', 'Data Berhasil Di Tambahkan!');
        return redirect()->back();
    }

    public function weekly_put(Request $request, $id)
    {
        $this->validate($request, [
            'self_evaluation'   => 'required',
            'keterangan'        => 'required',
            'gambar'            => 'image|max:3072'
        ]);

        $data =     $request->all();
        if ($request->hasFile('gambar')) {
            $existingData = Logbook::find($request->id);
            if ($existingData && $existingData->gambar) {
                $previousFilePath = public_path('assets/img/logbook/') . $existingData->gambar;
                if (file_exists($previousFilePath)) {
                    unlink($previousFilePath);
                }
            }
            $file = $request->file('gambar');
            $fileName = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('assets/img/logbook/'), $fileName);
            $data['gambar'] = $fileName;
        }
        $this->logbook->put($id, $data);
        Alert::success('success', 'Data Berhasil Di Ubah!');
        return redirect()->back();
    }

    public function weekly_print($id) {
        $pdf = Pdf::loadView('pdf', [
            'data'  => Logbook::get_print_by_id($id),
            'paraf' => Paraf::where('mentor_id', Logbook::get_print_by_id($id)->first()->mahasiswa->mentor->id)->value('ttd')
        ]);
        $pdf->setPaper('A4', 'portrait');
        // return $pdf->download(Auth::user()->nama.'_'.Auth::user()->nomor_induk.'_Logbook'.Faker::create()->randomNumber(5, true).'.pdf');
        return $pdf->stream();
    }

    public function weekly_print_all() {
        // return view('pdf', [
        //     'data'  => Logbook::get_print(),
        //     'paraf' => Paraf::where('mentor_id', Logbook::get_print()->first()->mahasiswa->mentor->id)->value('ttd')
        // ]);
        $pdf = Pdf::loadView('pdf', [
            'data'  => Logbook::get_print(),
            'paraf' => Paraf::where('mentor_id', Logbook::get_print()->first()->mahasiswa->mentor->id)->value('ttd')
        ]);
        $pdf->setPaper('A4', 'portrait');
        return $pdf->stream();

    }

    // LOGBOOK /4 BULAN
    public function evaluasi()
    {
        return view('mahasiswa.logbook.evaluasi', ['faker' => Faker::create()]);
    }

    // END MAHASISWA

    // MENTOR
    // Logbook Mahasiswa
    public function mentor_weekly()
    {
        confirmDelete("Reject Data", "Apakah anda yakin reject Logbook?");
        return view('mentor.logbook', [
            'mentor'    => $this->mentor->show(),
            'paraf'     => Paraf::show(),
            'logbook'   => $this->logbook->show_by_mentor(),
        ]);
    }

    public function mentor_weekly_put(Request $request, $id)
    {
        $this->validate($request, [
            'tool_used' => 'required',
            'safety_key_point' => 'required',
            'problem_solf' => 'required',
            'hyarihatto' => 'required',
            'mentor_eveluation' => 'required',
            'point_to_remember' => 'required',
            'komentar_mentor' => 'required',
            'paraf' => 'image|mimes:jpeg,png,jpg,gif,svg|max:10240'
        ]);

        if ($request->hasFile('paraf')) {
            $file = $request->file('paraf');
            $fileName = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('assets/img/paraf/'), $fileName);

            $paraf = ['mentor_id' => $this->mentor->show()->value('id'), 'ttd' => $fileName];
            if (Paraf::show()->isEmpty()) {
                Paraf::create($paraf);
            } else {
                Paraf::put(Paraf::show()->value('id'), ['ttd' => $fileName]);
            }
        }

        $data = $request->except('tambah','paraf');
        $data['status'] = 'accept';

        if ($this->logbook->put($id, $data)) {
            Alert::success('success', 'Data Berhasil Di Tambah!');
        }
        return redirect()->back();
    }

    public function mentor_weekly_delete($id)
    {
        if ($this->logbook->reject($id, ['status' => 'reject'])) {
            Alert::success('success', 'Data Berhasil Di Reject!');
            return redirect()->back();
        }
    }

    public function mentorPrint() {
        $pdf = Pdf::loadView('pdf', [
            'data'  => $this->logbook->show_by_mentor(),
            'paraf' => Paraf::where('mentor_id', $this->logbook->show_by_mentor()->first()->mahasiswa->mentor->id)->value('ttd')
        ]);
        $pdf->setPaper('A4', 'portrait');
        return $pdf->stream();
    }

    // DATA
    // PENGAJUAN MENTOR
    public function pengajuan_mentor(Request $request)
    {
        if ($request->has('button_accept')) {
            $this->validate($request, [
                'status' => 'required',
                'id' => 'required'
            ]);
            PengajuanMentor::find($request->id)->update($request->all());
            $this->mahasiswa->Put(PengajuanMentor::where('id', $request->id)->value('mahasiswa_id'), [
                'mentor_id' => PengajuanMentor::where('id', $request->id)->value('mentor_kedua')
            ]);
            Alert::success('Berhasil', 'Data Berhasil Di Accept!');
            return redirect()->back();
        }
        if ($request->has('button_reject')) {
            $this->validate($request, [
                'status' => 'required',
                'id' => 'required'
            ]);
            PengajuanMentor::find($request->id)->update($request->all());
            Alert::success('Berhasil', 'Data Berhasil Di Accept!');
            return redirect()->back();
        }
        return view('mentor.data.pengajuan_mentor', [
            'pengajuan_mentor' => PengajuanMentor::show_by_id_mentor()
        ]);
    }

    // LIST MAHASISWA
    public function list_mahasiswa()
    {
        return view('mentor.data.list_mahasiswa', ['mentor' => $this->mahasiswa->list_mahasiswa()]);
    }

    // ABSENSI MAHASISWA
    public function absensi_mahasiswa() {
        return view('mentor.absensi.absensi_mahasiswa' ,['absensi' => Absensi::list_absen_mahasiswa()]);
    }

    public function absensi_mahasiswa_reject($id) {
        $this->absensi->Ubah(['deskripsi_keterangan' => 'pulang cepat tanpa izin'], $id);
        Alert::success('Berhasil!', 'User Berhasil Di Reject');
        return redirect()->back();
    }

    public function absensi_mahasiswa_accept($id) {
        $this->absensi->Ubah(['deskripsi_keterangan' => 'pulang cepat dengan izin'], $id);
        Alert::success('Berhasil!', 'User Berhasil Di Accept');
        return redirect()->back();
    }
    // END MENTOR
}
