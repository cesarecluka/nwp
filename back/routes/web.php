<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->group(['prefix' => 'api'], function () use ($router) {
    $router->get('movies',  ['uses' => 'MoviesController@index']);
    $router->get('movies/{genre}',  ['uses' => 'MoviesController@getMovies']);
    $router->get('movies-trending',  ['uses' => 'MoviesController@getMoviesTrending']);
    $router->get('movie/{id}',  ['uses' => 'MoviesController@show']);
    $router->post('add-movie',  ['uses' => 'MoviesController@create']);

    $router->get('reviews',  ['uses' => 'ReviewsController@index']);
    $router->get('reviews/{search_term}',  ['uses' => 'ReviewsController@getReviewsByMovie']);
    $router->get('review/{id}',  ['uses' => 'ReviewsController@show']);
    $router->post('add-review',  ['uses' => 'ReviewsController@create']);


    $router->get('user/{id}',  ['uses' => 'UsersController@show']);
    $router->post('register',  ['uses' => 'UsersController@create']);
    $router->post('login',  ['uses' => 'UsersController@login']);

    $router->get('comments-review/{review_id}',  ['uses' => 'CommentsController@getCommentsReview']);
    $router->get('comments-movie/{movie_id}',  ['uses' => 'CommentsController@getCommentsMovie']);
    $router->post('add-comment',  ['uses' => 'CommentsController@create']);
    $router->put('update-comment',  ['uses' => 'CommentsController@update']);
    $router->delete('delete-comment/{id}',  ['uses' => 'CommentsController@delete']);



});
