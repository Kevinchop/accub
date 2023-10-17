<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Fuente extends Model
{
    //Esto se pone obligatoriamente en el modelo para proteger la edicion de los campos que no se pueden modificar
    protected $guarded = [
        'id'
    ];

    
    
    use HasFactory;
    use SoftDeletes; //esto me paso Facu para tener un campo de borrado y que no se pieda el registro
    
    public function lenguaje()
    {
        return $this->belongsTo(Lenguaje::class);
    }
}
