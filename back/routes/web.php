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

    $router->post('register/{user}',  ['uses' => 'UsersController@register']);


    // $router->get('pumpe/{kategorija_id}',  ['uses' => 'PumpeController@index']);
    // $router->get('pumpa/{id}',  ['uses' => 'PumpeController@show']);

});
