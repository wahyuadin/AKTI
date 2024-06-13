<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Logbook extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'logbook';
    protected $guarded = [];
    public function mahasiswa()
    {
        return $this->belongsTo(Mahasiswa::class);
    }
    public function Tambah($data)
    {
        return $this->create($data);
    }
    public function Ubah($data, $id)
    {
        return $this->find($id)->update($data);
    }
    public function Hapus($id)
    {
        return $this->find($id)->delete();
    }

    public function mentor() {
        return $this->belongsTo(Mentor::class);
    }

    public function dosen() {
        return $this->belongsTo(Dosen::class);
    }

    public function show()
    {
        return $this->with('mahasiswa.mentor.user')->whereHas('mahasiswa.user')->latest()->get();
    }

    public function show_by_id()
    {
        $user_id = Auth::user()->id;
        return Logbook::whereHas('mahasiswa.user', function ($query) use ($user_id) {
            $query->where('id', $user_id); })->with('mahasiswa.user')->latest()->get();
    }

    public function show_by_mentor()
    {
        $user_id = Auth::user()->id;
        return Logbook::whereHas('mahasiswa.mentor', function ($query) use ($user_id) {
            $query->where('user_id', $user_id);
        })->with('mahasiswa.mentor.user','mahasiswa.user')->latest()->get();
    }

    public function count_logbook_mentor($status) {
        $user_id = Auth::user()->id;
        return Logbook::whereHas('mahasiswa.mentor', function ($query) use ($user_id) {
            $query->where('user_id', $user_id);
        })->where('status', $status)->count();
    }

    public static function get_print_by_id($id) {
        return Self::with('mahasiswa.mentor')->where('id', $id)->get();
    }

    public static function get_print() {
        $user_id = Auth::user()->id;
        return Logbook::whereHas('mahasiswa.user', function ($query) use ($user_id) {
            $query->where('id', $user_id); })->with('mahasiswa.mentor.user')->latest()->get();
    }

    public function post($data)
    {
        return $this->create($data);
    }

    public function put($id, $data)
    {
        return $this->find($id)->update($data);
    }
    public function reject($id, $data)
    {
        return $this->find($id)->update($data);
    }

}
