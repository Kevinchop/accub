<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Credenciale extends Model
{
    protected $guarded = [
        'id'
    ];

    use HasFactory;

    //con esta funcion hacemos que Eloquent reconozca las relaciones entre las tablas
    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }
}
