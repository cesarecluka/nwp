<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Exception;
use Illuminate\Http\Request;

class CommentsController extends Controller
{


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getCommentsReview($review_id)
    {
        $comments = Comment::where('review_id', $review_id)->orderByDesc('created_at')->get();

        if($comments){
            return $comments;
        }else{
            return response()->json('Not found', 501);
        }
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getCommentsMovie($movie_id)
    {
        $comments = Comment::where('movie_id', $movie_id)->orderByDesc('created_at')->get();

        if($comments){
            return $comments;
        }else{
            return response()->json('Not found', 501);
        }
    }

    public function create(Request $request)
    {
        try{
            // $new_comment = [];
            // $new_comment["text"]= $request->text;
            // $new_comment["user_id"] = $request->user_id;
            // $new_comment["movie_id"] = $request->movie_id;
            // $new_comment["review_id"] = $request->review_id;
            // $new_comment["created_at"] = $request->created_at;

            // $comment = Comment::create($new_comment);

            $new_comment = new Comment();
            $new_comment->text = $request->text;
            $new_comment->user_id = $request->user_id;
            $new_comment->movie_id = $request->movie_id;
            $new_comment->review_id = $request->review_id;
            $new_comment->created_at = $request->created_at;

            $new_comment->save();

            return $new_comment;
        }catch(Exception $e){
            return $e->getMessage();
        }
    }

    public function update(Request $request)
    {
        $comment = Comment::findOrFail($request->id);

        $new_comment = $comment->update($request->only(['text']));

        if($new_comment)
            return $new_comment;
        else
            return response()->json('Not found', 501);
    }

    public function delete($id)
    {
        $comment = Comment::findOrFail($id);

        $res = $comment->delete();

        if($res)
            return true;
        else
            return false;
    }
}
