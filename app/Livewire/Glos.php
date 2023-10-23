<?php

namespace App\Livewire;

use Livewire\Component;
//No hay que olvidarse de cargar el modelo en las USE
use App\Models\Glosario;
use App\Models\Lenguaje;

class Glos extends Component
{

    //Acá la declaracion de las variables publicas
    public $cantDefi;
    public $cantLang;

    public $nombre_lenguaje;
    public $descripcion_lenguaje;

    public $nombre_definicion;
    public $descripcion_definicion;

    public $tabla = "Glosario";
    public $consulta;
    public $mostrador;
    public $info;

    //variables de edicion
    public $editing_id = null;
    public $nombre_upd;
    public $descripcion_upd;



    public function render()
    {
        $this->cantDefi = Glosario::count();
        $this->cantLang = Lenguaje::count();

        switch ($this->tabla) {
            case 'Glosario':
                $this->mostrador = Glosario::where('nombre', 'like', '%' . $this->consulta . '%')->orderBy('nombre', 'asc')->limit(5)->get();
                break;
            default:
                $this->mostrador = Lenguaje::where('nombre', 'like', '%' . $this->consulta . '%')->orderBy('nombre', 'asc')->limit(5)->get();
                break;
        }

        $existencia_lenguaje  = Lenguaje::where('nombre', $this->nombre_lenguaje)->count();

        if($existencia_lenguaje == 1){
            $this->info = "Ya cargado";
        }else{
            $this->info = "";
        }

        return view('livewire.glos');
    }

    public function agregarLenguaje()
    {
        $this->validate([
            'nombre_lenguaje' => 'required',
        ]);

        $lenguaje = new Lenguaje();

        $lenguaje->nombre = $this->nombre_lenguaje;
        $lenguaje->descripcion = $this->descripcion_lenguaje;
        $lenguaje->save();

        $this->reset(['nombre_lenguaje', 'descripcion_lenguaje']);
    }

    public function agregarDefinicion()
    {
        $definicion = new Glosario();

        $definicion->nombre = $this->nombre_definicion;
        $definicion->descripcion = $this->descripcion_definicion;
        $definicion->save();

        $this->nombre_definicion = "";
        $this->descripcion_definicion = "";
    }

    public function editClose()
    {
        $this->editing_id = null;
    }

    public function editingGlosario(Glosario $item)
    {
        //$items es una collection (array de objetos), cada registro es un objeto
        $this->editing_id = $item->id;
        $this->nombre_upd = $item->nombre;
        $this->descripcion_upd = $item->descripcion;
    }

    public function editingLenguaje(Lenguaje $item)
    {
        //$itemes es una collection (array de objetos), cada registro es un objeto
        $this->editing_id = $item->id;
        $this->nombre_upd = $item->nombre;
        $this->descripcion_upd = $item->descripcion;
    }

    public function updateGlosario(Glosario $item)
    {
        $item->update([
            'nombre' => $this->nombre_upd,
            'descripcion' => $this->descripcion_upd,
        ]);
        $this->editClose();
    }

    public function updateLenguaje(Lenguaje $item)
    {
        $item->update([
            'nombre' => $this->nombre_upd,
            'descripcion' => $this->descripcion_upd,
        ]);
        $this->editClose();
    }
}
