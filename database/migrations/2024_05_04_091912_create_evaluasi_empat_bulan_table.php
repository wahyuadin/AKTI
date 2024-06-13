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
        Schema::create('evaluasi_empat_bulan', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('absensi_id')->references('id')->on('absensi')->onUpdate('cascade');
            $table->foreignUuid('departement_id')->references('id')->on('departements')->onUpdate('cascade');
            $table->string('performa');
            $table->string('actual_point');
            $table->string('remarks');
            $table->string('range');
            $table->string('strong_point');
            $table->string('weakness_point');
            $table->string('development_skill');
            $table->string('development_knowledge');
            $table->text('catatan');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('evaluasi_empat_bulan');
    }
};
