<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Auth;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasUuids;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'nomor_induk',
        'nama',
        'email',
        'role',
        'password',
        'foto_profile',
        'alamat'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */

     public static function updatePassword($email, $password)
    {
        return static::where('email', $email)
            ->update(["password" => bcrypt($password)]);
    }

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function departement(){
        return $this->hasOne(Departement::class);
    }
    public function section(){
        return $this->hasOne(Section::class);
    }
    public function mentor()
    {
        return $this->belongsTo(Mentor::class);
    }
    public function mahasiswa(){
        return $this->hasOne(Mahasiswa::class);
    }
    public function dosen(){
        return $this->hasOne(Dosen::class);
    }
    public function Tampil()
    {
        return $this->latest()->get();
    }
    public function Tambah($data){
        return $this->create($data);
    }
    public function Ubah($user_id,$data){
        return $this->where('id',$user_id)->update($data);
    }
    public function Hapus($id){
        return $this->find($id)->delete();
    }
    public function LoginModel($data) {
        return Auth::attempt($data);
    }

    public static function role($data) {
        return static::where('nomor_induk', $data)->first()->role;
    }

    public static function put($id, $data) {
        return User::find($id)->update($data);
    }
}
