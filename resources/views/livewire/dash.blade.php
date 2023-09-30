<div>
    <div class="card">
        <div class="card-body">
            <div class="form-row">
                <div class="col-md-2">
                    <!--input for  fecha linked -->
                    <input type="date" wire:model="fecha" class="form-control" id="fecha">
                    @error('fecha')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror                 
                </div>
                <div class="col-md-2">
                    <input type="number" wire:model="idTarea" class="form-control" id="id_tarea" placeholder="N°">
                    @error('idTarea')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>

                <div class="col-md-5">
                    <input type="text" wire:model="nombre" class="form-control" id="nombre"
                        placeholder="Ej.: CAPACITACIÓN-TALLER TRAINING SOFT SKILLS">
                    @error('nombre')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="col-md-1">
                    <input type="number" wire:model="cantHs" class="form-control" id="horas" placeholder="Hs">
                    @error('cantHs')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>

                <div class="col-md-2">
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
                <div class="col-md-2 ml-auto">
                    <button id="btAgregarTarea" class="form-control btn-success" wire:click='guardar'>
                        <i class="fas fa-sign-in-alt"></i>
                        Agregar
                    </button>
                </div>

            </div>
        </div>
    </div>
    {{ $actividades }}    
</div>
