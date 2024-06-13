<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EvaluasiEmpatBulan extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'evaluasi_empat_bulan';
    protected $fillable = [
        'absensi_id',
        'departement_id',
        'performa',
        'actual_point',
        'remarks',
        'range',
        'strong_point',
        'weakness_point',
        'development_skill',
        'development_knowledge',
        'catatan'
    ];
    public function absensi()
    {
        return $this->belongsTo(Absensi::class);
    }

    /**
     * Get the departement that owns the evaluasi_empat_bulan.
     */
    public function departement()
    {
        return $this->belongsTo(Departement::class);
    }
    public function Tambah($data){
        return $this->create($data);
    }
    public function Ubah($data,$id){
        return $this->find($id)->update($data);
    }
    public function Hapus($id){
        return $this->find($id)->delete();
    }
}
