import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Movie } from '../models/Movie';


@Injectable({
  providedIn: 'root'
})
export class MovieService {

  constructor(private http: HttpClient) { }

  getMovie(id: number){
    return this.http.get<Movie>('http://localhost:8000/api/movie/'+id);
  }

  getMovies(genre: string): Observable<Movie[]> {
    if(genre == ''){
      return this.http.get<Movie[]>('http://localhost:8000/api/movies');
    }else{
      return this.http.get<Movie[]>('http://localhost:8000/api/movies/'+genre);
    }
  }

  getMoviesTrending(): Observable<Movie[]> {
    return this.http.get<Movie[]>('http://localhost:8000/api/movies-trending');
  }

  addMovie(movie: {}){
    return this.http.post<Movie>('http://localhost:8000/api/add-movie', movie);
  }
}
