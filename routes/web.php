<?php

use Illuminate\Support\Facades\Route;
// Controllers login
Route::get('/', function () {
    return view('login');
})->name('login');

// Controllers register
Route::get('/register', function () {
    return view('register');
})->name('register');

// Controllers home
Route::get('/home', function () {
    return view('home');
})->name('home');




