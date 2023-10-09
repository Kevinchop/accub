<div>
    {{-- Knowing others is intelligence; knowing yourself is true wisdom. --}}
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header bg-gradient-teal">
                    <ul class="nav nav-tabs card-header-tabs">
                        <li class="nav-item">
                            <div class="nav-link active">({{$cantLang}}) Lenguajes</div>
                        </li>
                        <li class="nav-item ml-auto">
                            <div class="nav-link active">
                                <i class="fas fa-code"></i>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="nombre_lenguaje">Nombre</label>
                        <input class="form-control" name="nombre_lenguaje" wire:model.live="nombre_lenguaje" type="text"
                            placeholder="Ej.: PHP">
                        @error('nombre_lenguaje')
                        {{-- cuando no es un componente x-adminlte, hay que ponerle el
                        @error('nombre_del_campo_del_wire:model') --}}
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="descripcion_lenguaje">Descripcion</label>
                        <textarea class="form-control" name="descripcion_lenguaje" wire:model="descripcion_lenguaje"
                            rows="3" placeholder="en caso de tenerla..."></textarea>
                    </div>
                    <div class="form-group d-flex mb-0">
                        <span class="text-muted pt-2">{{$info}}</span>
                        <button class="btn btn-secondary ml-auto" name="agregarLenguaje"
                            wire:click="agregarLenguaje">Agregar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-gradient-info">
                    <ul class="nav nav-tabs card-header-tabs">
                        <li class="nav-item">
                            <div class="nav-link active">({{$cantDefi}}) Definiciones</div>
                        </li>
                        <li class="nav-item ml-auto">
                            <div class="nav-link active">
                                <i class="fas fa-stream"></i>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="nombre_definicion">Nombre</label>
                        <input class="form-control" name="nombre_definicion" wire:model="nombre_definicion" type="text"
                            placeholder="Ej.: Pruebas cruzadas">
                        @error('nombre_definicion')
                        {{-- cuando no es un componente x-adminlte, hay que ponerle el
                        @error('nombre_del_campo_del_wire:model') --}}
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="descripcion_definicion">Descripcion</label>
                        <textarea class="form-control" name="descripcion_definicion" wire:model="descripcion_definicion"
                            rows="3" placeholder="Explicacion de la definicion..."></textarea>
                    </div>
                    <div class="form-group text-right mb-0">
                        <button class="btn btn-secondary ml-auto" name="agregarDefinicion"
                            wire:click="agregarDefinicion">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header bg-gradient-dark">
            <div class="row">
                <div class="col-md-2 my-1 ml-auto">
                    <select name="tabla" wire:model.live='tabla' class="form-control">
                        <option value="Glosario">Definiciones</option>
                        <option value="Lenguaje">Lenguajes</option>
                    </select>
                </div>
                <div class="col-md-4 my-1">
                    <input class="form-control" type="text" wire:model.live='consulta' placeholder="Buscar...">
                </div>
            </div>
        </div>

        <div class="card-body">
            @foreach ($mostrador as $item)
            <!-- Este DIV d-flex, oficia de ITEM de actividad, por lo cual se puede repetir tantas veces como items haya -->
            <div class="form-row border-bottom py-2 detalle_actividad">

                <div class="align-self-center col-md-3 py-1">
                    @if ($editing_id == $item->id)
                    <input type="text" class="form-control" wire:model='nombre_upd'>
                    @else
                    <div class="form-control">
                        {{$item->nombre}}
                    </div>
                    @endif
                </div>

                <div class="align-self-center col-md-7 py-1">
                    @if ($editing_id == $item->id)
                    <textarea class="form-control" rows="5" wire:model='descripcion_upd'></textarea>
                    @else
                    <div class="form-control overflow-auto">
                        {{$item->descripcion}}
                    </div>
                    @endif
                </div>

                {{-- // Si ponemos como ml-auto al que esta a la izquierda, empuja a todos los otros contra el borde
                derecho --}}
                <div class="align-self-center ml-auto py-1">
                    @if ($editing_id == $item->id)
                    <button wire:click="update{{$tabla}}({{ $item->id }})" class="btn btn-success btn-sm mr-1">
                        <i class="fa fa-check"></i>
                    </button>
                    <button wire:click="editClose()" class="btn btn-danger btn-sm">
                        <i class="fa fa-times"></i>
                    </button>
                    @else
                    <button wire:click="editing{{$tabla}}({{ $item->id }})" class="btn btn-primary btn-sm mr-1">
                        <i class="fa fa-edit"></i>
                    </button>
                    @endif
                </div>

            </div>
            @endforeach
        </div>
    </div>
</div>