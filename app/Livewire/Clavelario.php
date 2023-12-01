<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Categoria;
use App\Models\Credenciale;
use App\Models\Institucione;

class Clavelario extends Component
{
    protected $rules = [
        'user' => 'required',
        'pass' => 'required',
        'descripcion' => 'required'
    ];

    //variables del INSERT
    public $user;
    public $pass;
    public $categoria = 7; //tiene un default en la base de datos/migration
    public $institucion = 1; //tiene un default en la base de datos/migration
    public $descripcion;
    public $tipo = 'u'; //tiene un default en la base de datos/migration pero no me lo guarda, y le pone error si le saco el null

    //variables del UPDATE
    public $editing_id = null;
    public $user_upd;
    public $pass_upd;
    public $categoria_upd; //tiene un default en la base de datos/migration
    public $institucion_upd; //tiene un default en la base de datos/migration
    public $descripcion_upd;
    public $tipo_upd; //tiene un default en la base de datos/migration

    public $institucion_tabla;
    public $categoria_tabla;

    //Variables de Consulta
    public $instituciones;
    public $categorias;
    public $credenciales;
    public $cantCredenciales;

    public $consulta;


    public function mount()
    {
        //lo que se carga junto con la pagina
    }

    public function render()
    {
        $consulta = $this->consulta; //igualo acá para poder usarla dentro de la funcion de busqueda en tabla relacionada

        $this->instituciones = Institucione::orderby('nombre', 'asc')->get();
        $this->categorias = Categoria::orderby('nombre', 'asc')->get();

        $this->cantCredenciales = Credenciale::all()->count();

        //la saque de combate por el momento ya que necesito hacer la busqueda sobre un campo que esta en otra tabla
        //$this->credenciales = Credenciale::where('nombre', 'like', '%' . $this->consulta . '%')->get();

        //Consulta completita que incluye busqueda en 2 tablas realcionadas
        $this->credenciales = Credenciale::whereHas('institucion',
            function ($query) use ($consulta) {
                $query->where('nombre', 'like', '%' . $consulta . '%');
            })
            ->orWhereHas('categoria',
                function ($query) use ($consulta){
                    $query->where('nombre', 'like', '%' . $consulta . '%');
                })
            ->get();

        //CONSULTA DEL SISTEMA TECONTROL DE FACU
        // $this->detallehojas = Detallehoja::with('hojasasistencia.asistencia')->whereHas('hojasasistencia', function ($query) use ($cliente) {
        //     $query->whereHas('asistencia', function ($query) use ($cliente) {
        //         $query->where('client_id', $cliente);
        //     });
        // });

        return view('livewire.clavelario');
    }

    public function guardarCredencial()
    {
        $this->validate();

        $credencial = new Credenciale();

        $credencial->user = $this->user;
        $credencial->password = $this->pass;
        $credencial->categoria_id = $this->categoria;
        $credencial->institucion_id = $this->institucion;
        $credencial->descripcion = $this->descripcion;
        $credencial->tipo = $this->tipo;
        $credencial->save();

        $this->reset();
    }

    public function guardarInstitucion()
    {
        $institucion = new Institucione();

        $institucion->nombre = $this->institucion_tabla;
        $institucion->save();

        $this->institucion_tabla = "";
    }

    public function guardarCategoria()
    {
        $categoria = new Categoria();

        $categoria->nombre = $this->categoria_tabla;
        $categoria->save();

        $this->categoria_tabla = "";
    }

    public function editing(Credenciale $credencial)
    {
        //$credencial es una collection (array de objetos), cada registro es un objeto
        $this->editing_id = $credencial->id;
        $this->categoria_upd = $credencial->categoria_id;
        $this->user_upd = $credencial->user;
        $this->pass_upd = $credencial->password;
        $this->tipo_upd = $credencial->tipo;
    }

    public function update(Credenciale $credencial)
    {
        $credencial->update([
            'categoria_id' => $this->categoria_upd,
            'user' => $this->user_upd,
            'password' => $this->pass_upd
        ]);

        //en cao de que la clave sea del servidor radius de Accusys (compartida), modifico en todas las compartidas
        if($this->tipo_upd == 's'){
            Credenciale::where('tipo', 's')->update(['password' => $this->pass_upd]);
        }

        $this->editClose();
    }

    public function editClose()
    {
        $this->editing_id = null;
    }

}
