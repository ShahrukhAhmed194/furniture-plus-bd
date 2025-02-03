<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LogoSlider extends Model
{
    use HasFactory;

    protected $fillable = [
        'image', 'status', 'position' 
    ];

    public function scopeActive($q, $take = null){
        $q->where('status', 1);
        $q->orderBy('position');
        if($take){
            $q->take($take);
        }
    }
}
