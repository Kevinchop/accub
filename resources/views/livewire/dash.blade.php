{{-- Solo banca un Section por llamada Livewire --}}
<section id="cargador_actividades">
    <div class="card">
        <div class="card-body">
            <div class="form-row">
                <div class="col-md-2">
                    <label for="fecha">Fecha</label>
                    <!--INPUT de la fecha / wire:model apunta a la variable hecha en app/livewire/controlador -->
                    <input type="date" wire:model="fecha" class="form-control" id="fecha">
                    @error('fecha')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="col-md-2">
                    <label for="idTarea">ID</label>
                    <input type="number" wire:model="idTarea" class="form-control" id="id_tarea"
                        placeholder="Ej.: 101066">
                    @error('idTarea')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>

                <div class="col-md-5">
                    <label for="nombre">Actividad</label>
                    <input type="text" wire:model="nombre" class="form-control" id="nombre"
                        placeholder="Ej.: CAPACITACIÓN-TALLER TRAINING SOFT SKILLS">
                    @error('nombre')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="col-md-1">
                    <label for="horas">Cant.</label>
                    <input type="number" wire:model="cantHs" class="form-control" id="horas" placeholder="Hs">
                    @error('cantHs')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>

                <div class="col-md-2">
                    <label for="concepto">Concepto</label>
                    <select wire:model="concepto" class="form-control" id="concepto">
                        <option value="Hs_Presenciales">Hs Calendario</option>
                        <option value="Hs_Trabajo Remoto">Hs Trabajo Remoto</option>
                    </select>
                    @error('concepto')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-2 ml-auto mt-3">
                    <button id="btAgregarTarea" class="form-control btn-success" wire:click="guardar">
                        <i class="fas fa-sign-in-alt"></i>
                        Agregar
                    </button>
                </div>

            </div>
        </div>
    </div>

    {{-- Esta es la parte de abajo donde está el listado de actividades --}}
    <div class="card">
        <div class="card-header bg-secondary mr-0">
            <nav class="navbar">
                <form class="form-inline ml-auto">
                    <input class="form-control ml-auto" id="consulta_actividad" wire:model="consulta" type="search" placeholder="Buscar actividad">
                </form>
            </nav>
        </div>
        <div class="card-body">
            @foreach ($actividades as $actividad)
            <!-- Este DIV d-flex, oficia de ITEM de actividad, por lo cual se puede repetir tantas veces como items haya -->
            <div class="form-row border-bottom py-2 detalle_actividad">
                <div class="align-self-center col-md-2 py-1">
                    @if ($editing_id == $actividad->id)
                    <input type="date" wire:model="fecha_up" class="form-control">
                    @else
                    <span class="form-control bg-secondary text-white text-center" title="Fecha de actividad">
                        {{$actividad->fecha}}
                    </span>
                    @endif
                </div>

                <div class="align-self-center col-md-1 py-1">
                    @if ($editing_id == $actividad->id)
                    <input type="text" class="form-control" wire:model='idTarea_up'>
                    @else
                    <div class="form-control text-center" title="ID de actividad" title="{{$actividad->prefijo . " ::: " . $actividad->id_sec}}">
                        {{$actividad->id_tarea}}
                    </div>
                    @endif
                </div>

                <!-- Este texto tambien tiene que estar centrado en el item de la lista, por eso va con align-self-center tambien -->
                <div class="align-self-center col-md-5 py-1">
                    @if ($editing_id == $actividad->id)
                    <input type="text" class="form-control" wire:model='nombre_up'>
                    @else
                    <div class="form-control mr-3"> {{$actividad->nombre}} </div>
                    @endif
                </div>

                <div class="align-self-center col-md-1 py-1">
                    @if ($editing_id == $actividad->id)
                    <input type="number" class="form-control" wire:model='cantHs_up'>
                    @else
                    <div class="form-control"> {{$actividad->horas}} </div>
                    @endif
                </div>

                <div class="align-self-center ml-2 py-1">
                    @if ($editing_id == $actividad->id)
                    <select wire:model="concepto_up" class="form-control">
                        <option value="Hs_Presenciales">Hs Calendario</option>
                        <option value="Hs_Trabajo Remoto">Hs Trabajo Remoto</option>
                    </select>
                    @else
                    <div class="form-control">{{$actividad->concepto}}</div>
                    @endif
                </div>

                {{-- // Si ponemos como ml-auto al que esta a la izquierda, empuja a todos los otros contra el borde
                derecho --}}
                <div class="align-self-center ml-auto py-1">
                    @if ($editing_id == $actividad->id)
                    <button wire:click="updateActividad({{ $actividad->id }})" class="btn btn-success btn-sm mr-1">
                        <i class="fa fa-check"></i>
                    </button>
                    <button wire:click="editClose()" class="btn btn-danger btn-sm">
                        <i class="fa fa-times"></i>
                    </button>
                    @else
                    <button wire:click="editing({{ $actividad->id }})" class="btn btn-primary btn-sm mr-1">
                        <i class="fa fa-edit"></i>
                    </button>
                    @endif
                </div>
                {{-- <div class="mt-2 pr-3">$span_mascara</div> --}}
            </div>
            @endforeach
        </div>
    </div>
</section>