import { Component, OnInit, Input} from '@angular/core';
import { Movie } from '../../models/Movie';
import { MovieService } from '../../services/movie.service';

@Component({
  selector: 'app-movies-trending',
  templateUrl: './movies-trending.component.html',
  styleUrls: ['./movies-trending.component.scss']
})
export class MoviesTrendingComponent implements OnInit {

  trending1: Movie;
  trending2: Movie;
  trending3: Movie;

  constructor(private movieService: MovieService) { }

  ngOnInit(): void {
    this.getTrending()
  }

  getTrending(){
      this.movieService.getMoviesTrending().subscribe(movies => {

        if(movies.length != 0){
          let random = this.getRandomNumbers(movies.length);
          this.trending1 = movies[random[0]];
          this.trending2 = movies[random[1]];
          this.trending3 = movies[random[2]];
        }
      })

  }

  getRandomNumbers(length:number){
    let rand1, rand2, rand3;

    rand1 = Math.floor(Math.random() * length)

    rand2 = Math.floor(Math.random() * length)
    while(rand2 == rand1){
      rand2 = Math.floor(Math.random() * length)
    }

    rand3 = Math.floor(Math.random() * length)
    while(rand3 == rand1 || rand3 == rand2 ){
      rand3 = Math.floor(Math.random() * length)
    }

    return [rand1, rand2, rand3];
  }

}
