<?php

namespace App\Imports;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;

class UserImport implements ToModel
{
    public function model(array $row)
    {
        return new User([
            // Atur kolom database sesuai dengan data yang Anda impor dari file Excel
            'nama' => $row[0],
            'nomor_induk' => $row[1],
            'email' => $row[2],
            'role' => $row[3],
            'password' => Hash::make($row[4])
        ]);
    }
}
