<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dosen extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'dosen';
    protected $fillable = [
        'user_id',
        'prodi'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function mahasiswa(){
        return $this->hasMany(Mahasiswa::class);
    }
    public function Tampil()
    {
        return $this->with('user')->latest()->get();
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
}
