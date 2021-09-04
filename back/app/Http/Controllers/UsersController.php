<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UsersController extends Controller
{

    public function create(Request $request)
    {
        $new_user = [];
        $new_user["username"]= $request->username;
        $new_user["email"] = $request->email;
        $new_user["password"] = $request->password;
        $new_user["role"] = 'user';

        $user = User::create($new_user);

        return response()->json($user, 201);
    }


    public function login(Request $request){
        $user = User::where('username', $request->username)->first();

        if($user){
            if($user->password === $request->password){
                return $user;
            }
        }

        return null;
    }

    /**
     * Display the specified resource.
     *
     * @param  String  $route_param
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::findOrFail($id);

        if($user){
            return $user;
        }else{
            return response()->json('Not found', 501);
        }
    }
}
