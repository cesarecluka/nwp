import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Comment } from '../models/Comment';

@Injectable({
  providedIn: 'root'
})
export class CommentService {

  constructor(private http: HttpClient) { }

  getCommentsMovie(movie_id: number){
    return this.http.get<Comment[]>('http://localhost:8000/api/comments-movie/'+movie_id);
  }

  getCommentsReview(review_id: number){
    return this.http.get<Comment[]>('http://localhost:8000/api/comments-review/'+review_id);
  }

  addComment(comment: {}){
    return this.http.post<Comment>('http://localhost:8000/api/add-comment', comment);
  }

  updateComment(comment: {}){
    return this.http.put('http://localhost:8000/api/update-comment', comment);
  }

  deleteComment(id : number){
    return this.http.delete('http://localhost:8000/api/delete-comment/'+id);
  }
}
