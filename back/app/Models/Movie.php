<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{

    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title', 'genre', 'director', 'stars', 'release_date', 'img_url', 'video_url', 'description', 'trending'
    ];




    public function comments(){
        return $this->hasMany('App\Models\Comment');
    }
}
