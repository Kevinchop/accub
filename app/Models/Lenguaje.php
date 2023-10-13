<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Lenguaje extends Model
{
    //Esto se pone obligatoriamente en el modelo para proteger la edicion de los campos que no se pueden modificar
    protected $guarded = [
        'id'
    ];

    use HasMany;
    use HasFactory;

    public function fuentes()
    {
        return $this->hasMany(Fuente::class);
    }
}
