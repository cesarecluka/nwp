<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'text', 'user_id', 'post_id', 'review_id', 'created_at'
    ];



    public function user(){
        return $this->belongsTo('App\Models\User');
    }
}

