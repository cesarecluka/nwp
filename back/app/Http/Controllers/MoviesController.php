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
            return $movie;
        }else{
            return response()->json('Not found', 501);
        }
    }



    public function create(Request $request)
    {
        $new_movie = [];
        $new_movie["title"]= $request->title;
        $new_movie["genre"] = $request->genre;
        $new_movie["director"] = $request->director;
        $new_movie["stars"] = $request->stars;
        $new_movie["release_date"] = $request->release_date;
        $new_movie["img_url"] = $request->img_url;
        $new_movie["video_url"] = $request->video_url;
        $new_movie["description"] = $request->description;

        $movie = Movie::create($new_movie);

        if($movie){
            return $movie;
        }else{
            return response()->json('Error', 501);
        }
    }
}
