import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Review } from '../models/Review';

@Injectable({
  providedIn: 'root'
})
export class ReviewService {

  constructor(private http: HttpClient) { }

  getReview(id: number){
    return this.http.get<Review>('http://localhost:8000/api/review/'+id);
  }

  getReviews(search_term: string): Observable<Review[]>{
    if(search_term == ''){
      return this.http.get<Review[]>('http://localhost:8000/api/reviews')
    }else{
      return this.http.get<Review[]>('http://localhost:8000/api/reviews/'+search_term)
    }
  }

  addReview(review: {}){
    return this.http.post('http://localhost:8000/api/add-review', review);
  }
}
