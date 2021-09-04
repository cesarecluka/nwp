import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { CommentService } from 'src/app/services/comment.service';
import { Comment } from '../../../models/Comment';

@Component({
  selector: 'app-comments',
  templateUrl: './comments.component.html',
  styleUrls: ['./comments.component.scss']
})
export class CommentsComponent implements OnInit {

  @Input() id: number;
  @Input() isReview: boolean;

  comments: Comment[];

  text: string;
  error: string = "";

  constructor(private commentService: CommentService, private cookieService: CookieService, private router: Router) { }

  ngOnInit(): void {
    if(this.isReview){
      this.commentService.getCommentsReview(this.id).subscribe(res => {
        this.comments = res;
      })
    }else{
      this.commentService.getCommentsMovie(this.id).subscribe(res => {
        this.comments = res;
      })
    }
  }

  addComment(){
    if(!this.cookieService.get('role')){
      this.router.navigate(['/login'])
    }else if(this.text == ""){
      this.error = "No empty comments"
    }else{
      let user_id = JSON.parse(this.cookieService.get('user')).id;

      let created_at;
      let date = new Date();
      created_at = date.getUTCFullYear()+'-'+(date.getUTCMonth()+1 > 9 ? (date.getUTCMonth()+1) : '0'+(date.getUTCMonth()+1))+'-'+(date.getUTCDate() > 9 ? date.getUTCDate() : '0'+date.getUTCDate())+" "+date.getUTCHours()+":"+date.getUTCMinutes();

      let newComment;
      if(this.isReview){
          newComment = {
          text: this.text,
          user_id: user_id,
          movie_id: 0,
          review_id: this.id,
          created_at: created_at
        }
      }else{
          newComment = {
          text: this.text,
          user_id: user_id,
          movie_id: this.id,
          review_id: 0,
          created_at: created_at
        }
      }

      this.commentService.addComment(newComment).subscribe(res => {

        if(this.isReview){
          this.commentService.getCommentsReview(this.id).subscribe(res => {
            this.comments = res;
          })
        }else{
          this.commentService.getCommentsMovie(this.id).subscribe(res => {
            this.comments = res;
          })
        }

        this.text = "";
      })

    }
  }

  updateComments(){
    if(this.isReview){
      this.commentService.getCommentsReview(this.id).subscribe(res => {
        this.comments = res;
      })
    }else{
      this.commentService.getCommentsMovie(this.id).subscribe(res => {
        this.comments = res;
      })
    }
  }

}
