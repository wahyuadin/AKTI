<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResetPasswordModel extends Model
{
    protected $table = 'password_reset_tokens';
    use HasFactory;

    public static function verifyToken($token)
    {
        return static::where('remember_token', $token)
            ->where('status', 0)
            ->first();
    }

    public static function updatePasswordModel($email)
    {
        return static::where('email', $email)
            ->update(["status" => 1]);
    }

    public static function deleteToken($email) {
        return static::where('email', $email)
            ->delete();
    }

    public static function tokenModel($email, $token) {
        $user                    = User::where('email', $email)->first();
        $resetpw                 = new ResetPasswordModel();
        $resetpw->remember_token = $token;
        $resetpw->email          = $user->email;

        return $resetpw->save();
    }
}
