<?php

namespace App\Http\Controllers;

use App\Models\Dosen;
use App\Models\Mahasiswa;
use App\Models\Mentor;
use App\Models\User;
use \Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class MahasiswaController extends Controller
{
    protected $mentor;
    protected $dosen;
    protected $mahasiswa;
    protected $user;
    public function __construct(Mentor $mentor, Dosen $dosen, Mahasiswa $mahasiswa, User $user)
    {
        $this->mentor = $mentor;
        $this->dosen = $dosen;
        $this->mahasiswa = $mahasiswa;
        $this->user = $user;
    }
    public function mahasiswa()
    {
        $title = 'Mahasiswa';
        $mentor = $this->mentor->Tampil();
        $dosen = $this->dosen->Tampil();
        $data = $this->mahasiswa->Tampil();
        $batch = $this->mahasiswa->Batch();
        return view('admin.mahasiswa.index', compact('title', 'mentor', 'dosen', 'data', 'batch'));
    }
    public function edit_mahasiswa(Request $request, $id)
    {
        $this->mahasiswa->Ubah($id, [
            'dosen_id' => $request->dosen,
            'mentor_id' => $request->mentor,
            'noreg_vokasi' => $request->noreg_vokasi,
            'batch' => $request->batch,
            'shop' => $request->shop,
            'divisi' => $request->divisi,
            'line' => $request->line,
            'pos' => $request->pos,
            'shift' => $request->shift
        ]);
        $user_id = $request->user_id;
        $this->user->Ubah($user_id, [
            'nama' => $request->nama,
            'nomor_induk' => $request->nomor_induk
        ]);
        return redirect('admin/mahasiswa')->with('create', 'Data Berhasil Diubah');
    }
    public function delete_mahasiswa($id)
    {
        $this->mahasiswa->Hapus($id);
        return redirect('admin/mahasiswa')->with('delete', 'Data Berhasil Dihapus');
    }
    public function detail_mahasiswa($id)
    {
        $title = 'Mahasiswa';
        $data = $this->mahasiswa->Detail($id);
        return view('admin.mahasiswa.detail', compact('title', 'data'));
    }
    public function mhsfordsn()
    {
        $title = 'Mahasiswa';
        $id = Dosen::where('user_id', Auth::user()->id)->first();
        $data = $this->mahasiswa->WhereDosen($id->id);
        return view('dosen.mahasiswa', compact('title', 'data'));
    }
    public function mhsfordept()
    {
        $title = 'Mahasiswa';
        $data = $this->mahasiswa->WhereDept();
        return view('departement.mahasiswa', compact('title', 'data'));
    }
}
