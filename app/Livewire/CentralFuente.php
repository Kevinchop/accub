<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Fuente;
use App\Models\Lenguaje;


class CentralFuente extends Component
{
    protected $rules = [
        'nombre_fuente' => 'required',
        'lenguaje_a_usar' => 'required',
        'etiqueta_fuente' => 'required',
        'desarrollo_fuente' => 'required'

    ];

    //Para hacer el insert. Vienen de los campos del formulario
    public $nombre_fuente;
    public $lenguaje_a_usar = 1;
    public $etiqueta_fuente;
    public $desarrollo_fuente;

    //Variables de update. Contienen los datos traidos desde la base, que impactan en los campos y que viajaran para actualizarse.
    public $editing_id = null;
    public $nombre_fuente_upd;
    public $lenguaje_fuente_upd;
    public $etiqueta_fuente_upd;
    public $desarrollo_fuente_upd;

    public $fuentes; // Es la colección en el que pongo los objetos resultados de la consulta
    public $lenguajes; // Es la conlección en el que pongo los objetos Lenguaje para armar el select
    public $lenguaje_p_nombre;

    public $cantFuentes; //Es la cantidad de fuentes que voy teniendo en la base

    public $q_fuente; //Simboliza el campo donde escribo lo que se usará para la búsqueda.



    public function mount()
    {
        //todo el codigo que se carga junto con la pagina
    }

    public function render()
    {
        $this->lenguajes = Lenguaje::orderby('nombre', 'asc')->get();
        $this->cantFuentes = Fuente::count();
        //Esta consulta ya va completa y como las tabla estan relacionadas a traves de BelongsTo() en App\Models\Fuente.php
        $this->fuentes = Fuente::where('nombre', 'like', '%' . $this->q_fuente . '%')->get();

        return view('livewire.central-fuente');
    }

    public function agregarFuente()
    {
        $this->validate();

        $fuente = new Fuente();

        $fuente->nombre = $this->nombre_fuente;
        $fuente->lenguaje_id = $this->lenguaje_a_usar;
        $fuente->etiqueta = $this->etiqueta_fuente;
        $fuente->desarrollo = $this->desarrollo_fuente;
        $fuente->save();

        $this->reset();
    }

    public function editClose()
    {
        $this->editing_id = null;
    }

    public function editing(Fuente $fuente)
    {
        //$fuente es una collection (array de objetos), cada registro es un objeto
        $this->editing_id = $fuente->id;
        $this->nombre_fuente_upd = $fuente->nombre;
        $this->lenguaje_fuente_upd = $fuente->lenguaje_id;
        $this->etiqueta_fuente_upd = $fuente->etiqueta;
        $this->desarrollo_fuente_upd = $fuente->desarrollo;
    }

    public function update(Fuente $fuente)
    {
        $fuente->update([
            'nombre' => $this->nombre_fuente_upd,
            'lenguaje_id' => $this->lenguaje_fuente_upd,
            'etiqueta' => $this->etiqueta_fuente_upd,
            'desarrollo' => $this->desarrollo_fuente_upd
        ]);
        $this->editClose();
    }
}
