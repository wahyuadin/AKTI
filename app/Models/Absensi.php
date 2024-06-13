<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Absensi extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'absensi';
    protected $guarded = [];
    public function mahasiswa()
    {
        return $this->belongsTo(Mahasiswa::class);
    }
    public function evaluasiEmpatBulan()
    {
        return $this->hasMany(EvaluasiEmpatBulan::class);
    }
    public function Tampil(){
        return $this->with('mahasiswa')->latest()->get();
    }
    public function Tambah($data){
        return $this->create($data);
    }
    public function Ubah($data,$id){
        return $this->find($id)->update($data);
    }
    public function Hapus($id){
        return $this->find($id)->delete();
    }

    public static function tanggal() {
        date_default_timezone_set('Asia/Jakarta');
        $hari = array("Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu");
        $bulan = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");

        $tanggal_sekarang = date("d");
        $nama_hari = $hari[date("w")];
        $nama_bulan = $bulan[date("n") - 1];
        $tahun_sekarang = date("Y");
        $jam_sekarang = date("H:i:s");

        $tanggal_formatted = "$nama_hari, $tanggal_sekarang $nama_bulan $tahun_sekarang | $jam_sekarang";

        return $tanggal_formatted;
    }

    public static function list_absen_mahasiswa() {
        $user_id = Auth::user()->id;
        return Absensi::whereHas('mahasiswa.mentor.user', function ($query) use ($user_id) {
                    $query->where('user_id', $user_id);
                })->with('mahasiswa.user')->latest()->get();
    }


    public static function get_id_mahasiswa() {
        return Mahasiswa::where('user_id', Auth::user()->id)->get()->first();
    }
    public function show_by_id() {
        $user_id = Auth::user()->id;
        return Absensi::whereHas('mahasiswa.user', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })->with('mahasiswa.user')->latest()->get();
    }

    public function post($data) {
        return $this->create($data);
    }
}
