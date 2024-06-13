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
        Schema::create('pengajuan_mentors', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('mahasiswa_id')->references('id')->on('mahasiswa')->cascadeOnUpdate();
            $table->foreignUuid('mentor_pertama')->references('id')->on('mentors')->cascadeOnUpdate();
            $table->foreignUuid('mentor_kedua')->references('id')->on('mentors')->cascadeOnUpdate();
            $table->enum('status',['pending','accept','reject'])->default('pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pengajuan_mentor');
    }
};
