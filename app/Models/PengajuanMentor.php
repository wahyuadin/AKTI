<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class PengajuanMentor extends Model
{
    use HasFactory, HasUuids;
    protected $fillable = [
        'mahasiswa_id',
        'mentor_pertama',
        'mentor_kedua',
        'status',
    ];

    public function mahasiswa() {
        return $this->belongsTo(Mahasiswa::class);
    }

    public function mentorPertama()
    {
        return $this->belongsTo(Mentor::class, 'mentor_pertama');
    }

    public function mentorKedua()
    {
        return $this->belongsTo(Mentor::class, 'mentor_kedua');
    }

    public static function show_by_id_mahasiswa() {
        return self::with(['mahasiswa.user', 'mentorPertama.user', 'mentorKedua.user'])->whereHas('mahasiswa.user', function ($query) {
            $query->where('id', Auth::user()->id);})->latest()->get();
    }
    public static function show_by_id_mentor() {
        return self::with(['mentorPertama.user','mentorKedua.user','mahasiswa.user'])->whereHas('mentorPertama.user', function ($query) {
            $query->where('id', Auth::user()->id);})->latest()->get();
    }

    public static function post($data) {
        return PengajuanMentor::create($data);
    }


}
