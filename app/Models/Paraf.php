<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Paraf extends Model
{
    use HasFactory, HasUuids;

    protected $fillable = [
        'mentor_id',
        'ttd'
    ];

    public function mentor() {
        return $this->belongsTo(Mentor::class);
    }
    public static function show() {
        return self::with(['mentor.user'])->whereHas('mentor.user', function ($query) {
            $query->where('id', Auth::user()->id);})->latest()->get();
    }

    public static function post($data) {
        return Paraf::create($data);
    }

    public static function put($id, $data) {
        return Paraf::find($id)->update($data);
    }
}
