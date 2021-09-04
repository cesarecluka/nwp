<?php

namespace App\Http\Controllers;

use App\Http\Resources\Review as ResourcesReview;
use App\Models\Movie;
use App\Models\Review;
use Illuminate\Http\Request;

class ReviewsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $reviews = Review::all();

        if($reviews){
            return $reviews;
        }else{
            return response()->json('Not found', 501);
        }
    }

    /**
     * Display a listing of the resource by search term.
     *
     * @return \Illuminate\Http\Response
     */
    public function getReviewsByMovie($search_term)
    {
        $reviews = Array();
        $movies = Array();
        $movies = Movie::where('title', 'LIKE', "%{$search_term}%")->get();

        $movies_ids = array_column($movies->toArray(), 'id');
        foreach($movies_ids as $id) {
            $temp = Review::where('movie_id', $id)->get();
            if($temp){
                array_push($reviews, ...$temp);
            }
        }

        if($reviews){
            return $reviews;
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
        $review = Review::findOrFail($id);

        if($review){
            return $review;
        }else{
            return response()->json('Not found', 501);
        }
    }



    public function create(Request $request)
    {
        $new_review = [];
        $new_review["title"]= $request->title;
        $new_review["movie_id"] = $request->movie_id;
        $new_review["user_id"] = $request->user_id;
        $new_review["text"] = $request->text;

        $review = Review::create($new_review);

        return response()->json($review, 201);
    }
}
