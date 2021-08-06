<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function register($user)
    {
        $new_user = new User();
        $new_user->username= $user["username"];
        $new_user->email = $user["email"];
        $new_user->passwond = $user["password"];
        $new_user->role = 'user';

        return $new_user->save();


    }
}
