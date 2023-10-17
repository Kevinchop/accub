<?php

namespace Tests\Feature\Livewire;

use App\Livewire\Clavelario;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Livewire\Livewire;
use Tests\TestCase;

class ClavelarioTest extends TestCase
{
    /** @test */
    public function renders_successfully()
    {
        Livewire::test(Clavelario::class)
            ->assertStatus(200);
    }
}
