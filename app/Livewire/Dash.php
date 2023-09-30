<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\ast_actividad;

class Dash extends Component
{
    public $actividades;

    protected $rules = [
        'fecha' => 'required',
        'idTarea' => 'required',
        'nombre' => 'required',
        'cantHs' => 'numeric | required',
        'concepto' => 'required'
    ];

    public $fecha;
    public $idTarea;
    public $nombre;
    public $cantHs;
    public $concepto='Hs_Presenciales';

    public function mount()
    {
        
    }

    public function render()
    {
        $this->actividades = ast_actividad::all();
        return view('livewire.dash');
    }

    public function guardar()
    {
        dd('asdasd');
        $this->validate();

        $actividad = new ast_actividad();

        $actividad->fecha = $this->fecha;
        $actividad->idTarea = $this->idTarea;
        $actividad->nombre = $this->nombre;
        $actividad->cantHs = $this->cantHs;
        $actividad->concepto = $this->concepto;

        $actividad->save();

        $this->reset(['fecha', 'idTarea', 'nombre', 'cantHs', 'concepto']);
    }
}
