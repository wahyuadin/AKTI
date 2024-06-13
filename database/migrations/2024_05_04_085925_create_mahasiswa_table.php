<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('mahasiswa', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('user_id')->references('id')->on('users')->onUpdate('cascade');
            $table->foreignUuid('mentor_id')->references('id')->on('mentors')->onUpdate('cascade');
            $table->foreignUuid('dosen_id')->references('id')->on('dosen')->onUpdate('cascade');
            $table->bigInteger('noreg_vokasi');
            $table->bigInteger('batch');
            $table->string('divisi');
            $table->string('shop');
            $table->string('line');
            $table->string('pos');
            $table->enum('shift', ['white', 'red'])->default('white');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mahasiswa');
    }
};
