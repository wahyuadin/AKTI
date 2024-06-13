<?php

namespace App\Http\Controllers;

use App\Models\Mentor;
use App\Models\User;
use Illuminate\Http\Request;

class MentorController extends Controller
{
    protected $mentor;
    protected $user;
    public function __construct(Mentor $mentor, User $user)
    {
        $this->mentor = $mentor;
        $this->user = $user;
    }
    public function Mentor()
    {
        $title = 'Mentor';
        $data = $this->mentor->Tampil();
        return view('admin.mentor.index', compact('title', 'data'));
    }
    public function edit_mentor(Request $request, $id)
    {
        $user_id = $request->user_id;
        $this->user->Ubah($user_id, [
            'nama' => $request->nama,
            'email' => $request->email
        ]);
        $this->mentor->Ubah($id, [
            'no_telp' => $request->no_telp,
            'leader' => $request->leader
        ]);
        return redirect('admin/mentor')->with('update', 'Data berhasil diubah');
    }
    public function delete_mentor($id)
    {
        $this->mentor->Hapus($id);
        return redirect('admin/mentor')->with('delete', 'Data berhasil dihapus');
    }
    public function detail_mentor($id)
    {
        $title = 'Mentor';
        return view('admin.mentor.detail', compact('title'));
    }
}
