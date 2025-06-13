<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'name',
        'description',
        'price',
        'url_img',
    ];

    // ความสัมพันธ์: สินค้ามีหลายรีวิว
    public function reviews()
    {
        return $this->hasMany(Review::class);
    }
}
