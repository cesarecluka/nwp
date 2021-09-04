import { Component, OnInit } from '@angular/core';
import { Movie } from 'src/app/models/Movie';
import { MovieService } from 'src/app/services/movie.service';
import { ReviewService } from 'src/app/services/review.service';
import { CookieService } from 'ngx-cookie-service';
import {Router} from "@angular/router"

@Component({
  selector: 'app-add-review',
  templateUrl: './add-review.component.html',
  styleUrls: ['./add-review.component.scss']
})
export class AddReviewComponent implements OnInit {
  movies: Movie[] = [];
  title: string;
  movie_id: string;
  text: string;

  constructor(private reviewService: ReviewService, private movieService: MovieService, private cookieService: CookieService, private router: Router) { }

  ngOnInit(): void {
    this.getMovies();
  }

  getMovies(){
    this.movieService.getMovies('').subscribe(movies => {
      this.movies = movies;
    })
  }

  addReview(){
    const user = JSON.parse(this.cookieService.get('user'));

    const review ={
      title: this.title,
      movie_id: this.movie_id,
      user_id: user.id,
      text: this.text
    }

    this.reviewService.addReview(review).subscribe(res => {
      if(res){
        this.router.navigate(['/reviews'])
      }
    })
  }

}
