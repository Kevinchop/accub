<?php
/* Este controlador Dash de Livewire lo voy a usar de ejemplo para replicarlo en otros sistemas */

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
        'cantHs' => 'required',
        'concepto' => 'required'
    ];

    public $fecha;
    public $idTarea;
    public $nombre;
    public $cantHs;
    public $concepto = 'Hs_Presenciales'; //A este le ponemos algo porque el <select> está en posicion de reposo sin cambios

    // VARIABLES DE ACTUALIZACION
    public $editing_id = null;
    public $fecha_up;
    public $idTarea_up;
    public $nombre_up;
    public $cantHs_up;
    public $concepto_up;

    // VARIABLES MISCELANEAS
    public $horastrabajadas;
    public $diastrabajados;

    public $consulta;
 

    public function mount()
    {
        /* en la funcion mounto van todas las cosas que se renderizan cuando es invocado este controlador, pero quedan estáticas
        hasta que se recargue. */
    }

    public function render()
    {
        /* En render van todos los elementos que quedan como en un estado de conexion continua con la vista. Es dinamico y 
        sirve al sistema como nexo de AJAX entre las funciones */
        $this->actividades = ast_actividad::where('nombre', 'like', '%'. $this->consulta . '%')->orderBy('id', 'desc')->limit(5)->get();
        $this->horastrabajadas = ast_actividad::sum('horas');
        $this->diastrabajados = ast_actividad::all()->groupby('fecha')->count();
        return view('livewire.dash');
    }

    public function guardar()
    {
        $this->validate();

        $actividad = new ast_actividad();

        $actividad->fecha = $this->fecha;
        $actividad->id_tarea = $this->idTarea;
        $actividad->nombre = $this->nombre;
        $actividad->horas = $this->cantHs;
        $actividad->concepto = $this->concepto;

        $actividad->save();

        $this->reset(['fecha', 'idTarea', 'nombre', 'cantHs', 'concepto']);
    }

    //Cuando se cancela la edicion de un formulario, se llama a esta funcion
    public function editClose()
    {
        $this->editing_id = null;
    }

    //Esta funcion recarga las variables internas de un UPDATE, con los valores que vienen desde la base de datos
    public function editing(ast_actividad $actividad)
    {
        //$actividades es una collection (array de objetos), cada registro es un objeto
        $this->editing_id = $actividad->id;
        $this->fecha_up = $actividad->fecha;
        $this->idTarea_up = $actividad->id_tarea;
        $this->nombre_up = $actividad->nombre;
        $this->cantHs_up = $actividad->horas;
        $this->concepto_up = $actividad->concepto;
    }

    public function updateActividad(ast_actividad $actividad)
    {
        $actividad->update([
            'fecha' => $this->fecha_up,
            'id_tarea' => $this->idTarea_up,
            'nombre' => $this->nombre_up,
            'horas' => $this->cantHs_up,
            'concepto' => $this->concepto_up
        ]);
        $this->editClose();
    }
}
