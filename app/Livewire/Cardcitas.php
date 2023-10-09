<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Fuente;
use App\Models\Lenguaje;
use App\Models\Glosario;


class Cardcitas extends Component
{
    //Acá la declaracion de las variables publicas
    public $cantDefi;
    public $cantLang;
    public $cantFuentes;

    public function mount()
    {
        // Aca va todo lo estático que se carga junto con la pagina

    }

    public function render()
    {
        // y aca adentro va todo lo que tiene que permanecer en estrecho contacto con el servidor [AJAX]
        $this->cantDefi = Glosario::count();
        $this->cantLang = Lenguaje::count();
        $this->cantFuentes = Fuente::count();

        return view('livewire.cardcitas');
    }
}
