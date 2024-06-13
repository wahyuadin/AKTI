<?php

namespace App\Http\Controllers;

use App\Models\Dosen;
use App\Models\Mahasiswa;
use Illuminate\Http\Request;

class DosenController extends Controller
{
    protected $dosen;
    protected $mahasiswa;
    public function __construct(Dosen $dosen, Mahasiswa $mahasiswa)
    {
        $this->dosen = $dosen;
        $this->mahasiswa = $mahasiswa;
    }
    public function Dosen()
    {
        $title = 'Dosen';
        $data = $this->dosen->Tampil();
        return view('admin.dosen.index', compact('title', 'data'));
    }
    public function detail_dosen($id)
    {
        $title = 'Dosen';
        $data = $this->mahasiswa->WhereDosen($id);
        return view('admin.dosen.detail', compact('title', 'data'));
    }
}
