<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Credenciale extends Model
{
    protected $guarded = [
        'id'
    ];

    use HasFactory;
    use SoftDeletes;

    /* con esta funcion hacemos que Eloquent reconozca las relaciones entre las tablas
        accediendo desde las credenciales, a los campos de la categoria. Esto se expresa
        como "muchas credenciales pueden acceder a una misma categoria */
    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }
}
