<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title', 'movie_id', 'user_id', 'text', 'created_at',
    ];



    public function user(){
        return $this->belongsTo('App\Models\User');
    }

    public function comments(){
        return $this->hasMany('App\Models\Comment');
    }
}

