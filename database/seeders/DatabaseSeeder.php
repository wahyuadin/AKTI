<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Faker\Factory as Faker;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $faker = Faker::create();
        User::create([
            'nama'          => $faker->name,
            'nomor_induk'   => '123456',
            'email'         => $faker->unique()->safeEmail,
            'alamat'        => $faker->address,
            'password' => Hash::make('akti2024'),
        ]);

        User::create([
            'nama' => $faker->name,
            'nomor_induk' => '11223344',
            'email' => $faker->unique()->safeEmail,
            'alamat'        => $faker->address,
            'password' => Hash::make('akti2024'),
            'role'  => 'mentor'
        ]);

        User::create([
            'nama' => $faker->name,
            'nomor_induk' => '11223344',
            'email' => $faker->unique()->safeEmail,
            'alamat'        => $faker->address,
            'password' => Hash::make('akti2024'),
            'role'  => 'admin'
        ]);

        User::create([
            'nama' => $faker->name,
            'nomor_induk' => '111222333444',
            'alamat'        => $faker->address,
            'email' => $faker->unique()->safeEmail,
            'password' => Hash::make('akti2024'),
            'role'  => 'departement'
        ]);

        User::create([
            'nama' => $faker->name,
            'nomor_induk' => '121212',
            'alamat'        => $faker->address,
            'email' => $faker->unique()->safeEmail,
            'password' => Hash::make('akti2024'),
            'role'  => 'section'
        ]);

        User::create([
            'nama' => $faker->name,
            'nomor_induk' => '131313',
            'alamat'        => $faker->address,
            'email' => $faker->unique()->safeEmail,
            'password' => Hash::make('akti2024'),
            'role'  => 'dosen'
        ]);

        for ($i = 0; $i < 50; $i++) {
            User::create([
                'nama' => $faker->name,
                'nomor_induk' => $faker->randomNumber(5, true),
                'alamat'        => $faker->address,
                'email' => $faker->unique()->safeEmail,
                'password' => Hash::make('akti2024'),
            ]);
        }

        for ($i = 0; $i < 50; $i++) {
            User::create([
                'nama' => $faker->name,
                'nomor_induk' => $faker->randomNumber(5, true),
                'alamat'        => $faker->address,
                'email' => $faker->unique()->safeEmail,
                'password' => Hash::make('akti2024'),
                'role' => 'mentor',
            ]);
        }

        for ($i = 0; $i < 50; $i++) {
            User::create([
                'nama' => $faker->name,
                'nomor_induk' => $faker->randomNumber(5, true),
                'alamat'        => $faker->address,
                'email' => $faker->unique()->safeEmail,
                'password' => Hash::make('akti2024'),
                'role' => 'departement',
            ]);
        }

        for ($i = 0; $i < 50; $i++) {
            User::create([
                'nama' => $faker->name,
                'nomor_induk' => $faker->randomNumber(5, true),
                'alamat'        => $faker->address,
                'email' => $faker->unique()->safeEmail,
                'password' => Hash::make('akti2024'),
                'role' => 'section',
            ]);
        }
    }
}
