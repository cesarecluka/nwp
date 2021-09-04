import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import { Review } from 'src/app/models/Review';
import { Movie } from 'src/app/models/Movie';
import { User } from 'src/app/models/User';
import { Comment } from 'src/app/models/Comment';
import { ReviewService } from 'src/app/services/review.service';
import { MovieService } from 'src/app/services/movie.service';
import { AuthService } from 'src/app/services/auth.service';
import { CommentService } from 'src/app/services/comment.service';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['./review.component.scss']
})
export class ReviewComponent implements OnInit {
  review: Review;
  movie: Movie;
  user: User;
  comments: Comment[];

  constructor(private route:ActivatedRoute, private reviewService: ReviewService, private movieService: MovieService, private authService: AuthService, private commentService: CommentService) { }

  ngOnInit(): void {
    this.getReview();
  }

  getReview(){
    this.reviewService.getReview(Number(this.route.snapshot.paramMap.get('review_id'))).subscribe(res => {
      this.review = res;
      this.getMovie(res.movie_id);
      this.getUser(res.user_id);
      this.getComments(res.id);
    })
  }

  getMovie(id: number){
    this.movieService.getMovie(id).subscribe(res => {
      this.movie = res;
    })
  }

  getUser(id: number){
    this.authService.getUser(id).subscribe(res => {
      this.user = res;
    })
  }

  getComments(id : number){
    this.commentService.getCommentsReview(id).subscribe(res => {
      this.comments = res;
    })
  }

}
