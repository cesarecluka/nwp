import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Movie } from '../models/Movie';


@Injectable({
  providedIn: 'root'
})
export class MovieService {

  constructor(private http: HttpClient) { }

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
}
