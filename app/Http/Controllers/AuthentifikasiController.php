<?php

namespace App\Http\Controllers;

use App\Models\ResetPasswordModel;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Mail;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Str;

class AuthentifikasiController extends Controller
{
    public function login() {
        $rememberDevice = Cookie::get('remember_device', false);
        return view('login', compact('rememberDevice'));
    }

    public function loginsubmit(Request $request) {
        $this->validate($request,
            ['nomor_induk'          => 'required','password' => 'required'],
            ['nomor_induk.required' => 'Nomor Induk Wajib diisi'],
            ['password.required'    => 'Password Wajib diisi'],
        );

        if ($request->has('remember_device')) {
            Cookie::queue(Cookie::forever('remember_device', json_encode($request->all())));
        } else {
            Cookie::queue(Cookie::forget('remember_device'));
        }

        $loginmodel = new User();
        if ($loginmodel->LoginModel($request->only(['nomor_induk','password']))) {
            Alert::success('Success', 'Login Berhasil');
            return redirect(route('dashboard.'. User::role($request->nomor_induk)));
        } else {
            Alert::error('Gagal', 'Username Atau Password Salah');
            return redirect(route('login'));
        }
    }

    public function lupa_password(Request $request) {
        if ($request->has('submit')) {
            $this->validate($request, [
                'email'                 => 'required|exists:users,email'
            ], [
                'email.required'  => 'Email Wajib diisi',
                'email.exists'    => 'Email tidak terdaftar'
            ]);

            $request->session()->put('token', Str::random(64));
            if (ResetPasswordModel::tokenModel($request->email, $request->session()->get('token'))) {
                $user = User::where('email', $request->email)->first();
                Mail::send('email.email', ['token' => $request->session()->get('token'), "user" => $user], function($message) use($user){
                    $message->to($user->email);
                    $message->subject('Pengaturan Ulang Kata Sandi');
                });

                $email          = $user->email;
                $hidden_email   = substr($email, 0, 1) . str_repeat('*', strlen($email) - 1) . '@' . explode('@', $email)[1];
                return back()->with('message', 'Kami telah mengirim email dengan atas nama ' . $hidden_email);
            }
        }
        return view('lupa_password');
    }

    public function showResetPasswordForm(Request $request, $token) {
        $query = ResetPasswordModel::verifyToken($token);
        if (isset($query)) {
            if ($request->has('submit')) {
                $this->validate($request, [
                    'password'      => 'required|min:6|max:30',
                    'repassword'    => 'required|same:password|min:6|max:30'
                ], [
                    'password.required'        => 'Kata sandi wajib diisi.',
                    'password.min'             => 'Kata sandi minimal harus mengandung :min karakter.',
                    'password.max'             => 'Kata sandi tidak boleh lebih dari :max karakter.',
                    'repassword.required'      => 'Ulangi kata sandi wajib diisi.',
                    'repassword.same'          => 'Kata sandi ulang harus sama dengan kata sandi sebelumnya.',
                    'repassword.min'           => 'Kata sandi ulang minimal harus mengandung :min karakter.',
                    'repassword.max'           => 'Kata sandi ulang tidak boleh lebih dari :max karakter.'
                ]);

                if (ResetPasswordModel::updatePasswordModel($query->email)) {
                    if (User::updatePassword($query->email, $request->repassword)) {
                        ResetPasswordModel::deleteToken($query->email);
                        $request->session()->flush();
                    }
                    Alert::success('Berhasil', 'Data telah diubah !');
                    return redirect(route('login'));
                }
            }
            return view('email.verif', ["email" => $query->email]);
        }
        Alert::error('Gagal', 'Token Tidak Valid !');
        return redirect(route('lupa_password'));
    }


    public function logout() {
        Alert::success('Success', 'logout Berhasil !');
        Auth::logout();
        return redirect(route('login'));
    }
}
