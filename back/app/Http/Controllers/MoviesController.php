<?php

namespace App\Http\Controllers;

use App\Http\Resources\Movie as ResourcesMovie;
use App\Models\Movie;
use Illuminate\Http\Request;

class MoviesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $movies = Movie::all();

        if($movies){
            return $movies;
        }else{
            return response()->json('Not found', 501);
        }
    }


    /**
     * Display a listing of the resource by genre.
     *
     * @return \Illuminate\Http\Response
     */
    public function getMovies($genre)
    {
        $movies = Movie::where('genre', $genre)->get();

        if($movies){
            return $movies;
        }else{
            return response()->json('Not found', 501);
        }
    }


    /**
     * Display a listing of the resource by criteria trending.
     *
     * @return \Illuminate\Http\Response
     */
    public function getMoviesTrending()
    {
        $movies = Movie::where('trending', 1)->get();

        if($movies){
            return $movies;
        }else{
            return response()->json('Not found', 501);
        }
    }


    /**
     * Display the specified resource.
     *
     * @param  String  $route_param
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $movie = Movie::findOrFail($id);

        if($movie){
            return new ResourcesMovie($movie);
        }else{
            return response()->json('Not found', 501);
        }
    }
}
