<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Section extends Model
{
    use HasFactory, HasUuids;
    protected $fillable = [
        'user_id',
        'departement_id',
        'section'
    ];
    public function user(){
        return $this->belongsTo(User::class);
    }
    public function departement(){
        return $this->belongsTo(Departement::class);
    }
    public function mentor()
    {
        return $this->hasMany(Mentor::class);
    }
    public function Tampil(){
        return $this->with('user','departement')->latest()->get();
    }
    public function Tambah($data){
        return $this->create($data);
    }
    public function Ubah($id,$data){
        return $this->find($id)->update($data);
    }
    public function Hapus($id){
        return $this->find($id)->delete();
    }

    public function show_by_id() {
        return $this->with('user','departement.user')->where('user_id', Auth::user()->id)->latest()->get();
    }
}
