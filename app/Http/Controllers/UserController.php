<?php

namespace App\Http\Controllers;

use App\Imports\UserImport;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use Validator;

class UserController extends Controller
{
    protected $user;
    public function __construct(User $user)
    {
        $this->user = $user;
    }
    public function login()
    {
        return view('auth.login');
    }
    public function postLogin(Request $request)
    {
        if (Auth::attempt(['nomor_induk' => $request->nomor_induk, 'password' => $request->password])) {
            // Periksa peran pengguna setelah berhasil login
            if (Auth::user()->role == 'admin') {
                // Jika peran adalah 'admin', redirect ke dashboard admin
                return redirect()->intended('/admin/dashboard');
            } elseif (Auth::user()->role == 'dosen') {
                // Jika peran adalah 'user', redirect ke dashboard user
                return redirect()->intended('/dosen/dashboard');
            } elseif (Auth::user()->role == 'departement') {
                // Jika peran adalah 'user', redirect ke dashboard user
                return redirect()->intended('/departement/dashboard');
            } elseif (Auth::user()->role == 'mahasiswa') {
                // Jika peran adalah 'user', redirect ke dashboard user
                return redirect()->intended('/mahasiswa/dashboard');
            }
        }

        // Jika autentikasi gagal, kembalikan ke halaman login dengan pesan error
        return back();
    }
    public function logout()
    {
        Auth::logout();
        return redirect('/');
    }
    public function pengguna()
    {
        $title = 'Manajemen Pengguna';
        $data = $this->user->Tampil();
        return view('admin.pengguna', compact('title', 'data'));
    }
    public function add_pengguna(Request $request)
    {
        $val = Validator::make($request->all(), [
            'email' => 'email|unique:users',
        ]);
        if ($val->fails()) {
            return redirect()->back()->withErrors($val);
        }
        $this->user->Tambah([
            'nama' => $request->nama,
            'nomor_induk' => $request->nomor_induk,
            'email' => $request->email,
            'role' => $request->role,
            'password' => 'akti2024'
        ]);
        return redirect()->back()->with('create', 'Data Berhasil Di Tambah');
    }
    public function unduh_template()
    {
        $file = public_path('template/pengguna.xlsx');
        return response()->download($file);
    }
    public function import(Request $request)
    {
        $val = Validator::make($request->all(), [
            'file' => 'mimes:xlsx,xls'
        ]);
        if ($val->fails()) {
            return redirect('admin/pengguna')->withErrors($val);
        }
        Excel::import(new UserImport, $request->file('file'));
        return redirect('admin/pengguna')->with('create', 'Data Berhasil Ditambah');
    }
    public function edit_pengguna($id, Request $request)
    {
        $data = [
            'nama' => $request->nama,
            'nomor_induk' => $request->nomor_induk,
            'email' => $request->email,
            'role' => $request->role
        ];
        $this->user->Ubah($id, $data);
        return redirect('admin/pengguna')->with('update', 'Data Berhasil Diubah');
    }
    public function hapus_pengguna($id){
        $this->user->Hapus($id);
        return redirect('admin/pengguna')->with('delete','Data Berhasil Dihapus');
    }
}
