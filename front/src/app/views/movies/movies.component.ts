import { Component, OnInit } from '@angular/core';
import { MovieService } from '../../services/movie.service';
import { Movie } from '../../models/Movie';

@Component({
  selector: 'app-movies',
  templateUrl: './movies.component.html',
  styleUrls: ['./movies.component.scss']
})
export class MoviesComponent implements OnInit {

  movies: Movie[] = [];
  genres: string[] = [];
  current_genre: string = '';

  constructor(private movieService: MovieService) { }

  ngOnInit(): void {
    this.getMovies('');

  }

  getMovies(genre: string){
    this.movieService.getMovies(genre).subscribe(movies => {
      this.movies = movies;

      if(this.genres.length < 1){
        this.genres = Array.from(new Set((movies.map(a => a.genre))));
      }
    })
  }

  changeGenre(genre: string){
    this.current_genre = genre;

    this.getMovies(genre);
  }

  removeGenre(){
    this.current_genre = '';

    this.getMovies('');
  }
}


