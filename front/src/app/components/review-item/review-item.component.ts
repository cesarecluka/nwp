import { Component, OnInit, Input } from '@angular/core';
import { Movie } from 'src/app/models/Movie';
import { Review } from 'src/app/models/Review';
import { User } from 'src/app/models/User';
import { AuthService } from 'src/app/services/auth.service';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-review-item',
  templateUrl: './review-item.component.html',
  styleUrls: ['./review-item.component.scss']
})
export class ReviewItemComponent implements OnInit {
  @Input() review: Review;
  movie: Movie;
  user: User;

  constructor(private movieService: MovieService, private authService: AuthService) { }

  ngOnInit(): void {
    this.getMovie();
    this.getUser();
  }

  getMovie(){
    this.movieService.getMovie(this.review.movie_id).subscribe(res => {
      this.movie = res;
    })
  }

  getUser(){
    this.authService.getUser(this.review.user_id).subscribe(res => {
      this.user = res;
    })
  }

}
