<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('absensi', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('mahasiswa_id')->references('id')->on('mahasiswa')->onUpdate('cascade');
            $table->enum('keterangan',['hadir','tidak hadir','izin']);
            $table->string('deskripsi')->nullable();
            $table->enum('status',['datang','pulang','lainnya'])->nullable();
            $table->string('deskripsi_keterangan');
            $table->string('bukti')->nullable();
            $table->string('waktu')->nullable();
            $table->string('filter')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('absensi');
    }
};
