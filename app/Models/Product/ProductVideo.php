<?php

namespace App\Models\Product;


use App\Models\Product\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Builder;

class ProductVideo extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable =[
        'product_id', 'embed_video', 'status'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function scopeActive(Builder $query)
    {
        return $query->where('status', 1);
    }
}
