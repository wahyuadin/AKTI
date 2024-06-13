<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Upload extends Model
{
    use HasFactory, HasUuids;
    protected $fillable = [
        'mahasiswa_id',
        'presentasi_final',
        'laporan_ta',
        'report_a3',
        'sertifikat',
    ];

    public function mahasiswa() {
        return $this->belongsTo(Mahasiswa::class);
    }

    public function show() {
        return $this->with('mahasiswa')->latest()->get();
    }

    public function show_by_id() {
        $user_id = Auth::user()->id;
        return Upload::whereHas('mahasiswa.user', function ($query) use ($user_id) {
            $query->where('id', $user_id);
        })->with('mahasiswa.user')->latest()->get();
    }

    public function post($data) {
        return $this->create($data);
    }
    public function put($id, $data)
    {
        return $this->find($id)->update($data);
    }

    public function dataUpload()
    {
        $latestBatchId = Mahasiswa::orderBy('batch', 'desc')->value('batch');

        // Ambil data uploads yang berhubungan dengan batch terbaru
        return $this->whereHas('mahasiswa', function ($query) use ($latestBatchId) {
            $query->where('batch', $latestBatchId);
        })->get();
    }
    public function postData($data)
    {
        $latestBatchId = $data;

        // Ambil data uploads yang berhubungan dengan batch terbaru
        return $this->whereHas('mahasiswa', function ($query) use ($latestBatchId) {
            $query->where('batch', $latestBatchId);
        })->get();
    }
    public function dataUploadDosen()
    {
        // Ambil id dosen yang sedang login (saya berasumsi Anda memiliki mekanisme autentikasi yang sesuai)
        $loggedInDosenId = Dosen::where('user_id',Auth::user()->id)->value('id');// Anda mungkin perlu menyesuaikannya dengan cara Anda sendiri untuk mendapatkan id dosen yang sedang login

        // Dapatkan batch terbaru
        $latestBatchId = Mahasiswa::orderBy('batch', 'desc')->value('batch');

        // Ambil data uploads yang berhubungan dengan batch terbaru dan sesuai dengan dosen_id yang sedang login
        return $this->whereHas('mahasiswa', function ($query) use ($latestBatchId, $loggedInDosenId) {
            $query->where('batch', $latestBatchId)
                ->where('dosen_id', $loggedInDosenId);
        })->get();
    }
    public function postDataDosen($data)
    {
        $loggedInDosenId = Dosen::where('user_id',Auth::user()->id)->value('id');
        $latestBatchId = $data;

        // Ambil data uploads yang berhubungan dengan batch terbaru
        return $this->whereHas('mahasiswa', function ($query) use ($latestBatchId, $loggedInDosenId) {
            $query->where('batch', $latestBatchId)
                ->where('dosen_id', $loggedInDosenId);
        })->get();
    }
}
