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

    ];

    public $consulta;
    public $fuentes;
    public $lenguajes;
    public $lenguaje_a_usar = 'PHP';
    public $info;
    public $cantFuentes;
    public $nombre_fuente;
    public $etiqueta_fuente;
    public $desarrollo_fuente;
    public $q_fuente;

    //variables de update
    public $editing_id = null;
    public $nombre_fuente_upd;
    public $lenguaje_fuente_upd;
    public $etiqueta_fuente_upd;
    public $desarrollo_fuente_upd;


    public function mount()
    {
        //todo el codigo que se carga junto con la pagina
    }

    public function render()
    {
        $this->lenguajes = Lenguaje::all();
        $this->cantFuentes = Fuente::count();
        $this->fuentes = Fuente::join('lenguajes', 'fuentes.lenguaje_id', '=', 'lenguajes.id')
            ->select('fuentes.id AS id_fuente','fuentes.nombre AS n_fuente', 'lenguajes.id AS id_lenguaje', 'fuentes.desarrollo', 'lenguajes.nombre AS n_lenguaje')
            ->where('fuentes.nombre', 'like', '%' . $this->consulta . '%')
            ->orderBy('fuentes.nombre', 'asc')->get();

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
        $this->nombre_fuente_upd = $fuente->n_fuente;
        $this->etiqueta_fuente_upd = $fuente->etiqueta;
        $this->desarrollo_fuente_upd = $fuente->desarrollo;
    }

    public function update(Fuente $fuente)
    {
        $fuente->update([
            'nombre' => $this->nombre_upd,
            'lenguaje' => $this->lenguaje_fuente_upd,
            'etiqueta' => $this->etiqueta_fuente_upd,
            'desarrollo' => $this->desarrollo_fuente_upd
        ]);
        $this->editClose();
    }
}
