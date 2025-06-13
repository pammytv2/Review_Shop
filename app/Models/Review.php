<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $fillable = [
        'product_id',
        'user_id',
        'rating',
        'content',
    ];
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
