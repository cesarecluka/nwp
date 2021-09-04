import { Component, OnInit } from '@angular/core';
import { ReviewService } from 'src/app/services/review.service';
import { Review } from '../../models/Review';

@Component({
  selector: 'app-reviews',
  templateUrl: './reviews.component.html',
  styleUrls: ['./reviews.component.scss']
})
export class ReviewsComponent implements OnInit {

  reviews: Review[] = [];
  search_term: string = '';

  constructor(private reviewService: ReviewService) { }

  ngOnInit(): void {
    this.getReviews('');

  }

  getReviews(term: string){
    this.reviewService.getReviews(term).subscribe(res => {
      this.reviews = res;
      console.log(res)
    })
  }

  onSearch(){
    this.getReviews(this.search_term);
  }
}
