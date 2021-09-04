import { Component, OnInit, Input, EventEmitter, Output } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { User } from 'src/app/models/User';
import { AuthService } from 'src/app/services/auth.service';
import { CommentService } from 'src/app/services/comment.service';
import { Comment } from '../../../models/Comment';

@Component({
  selector: 'app-comment-item',
  templateUrl: './comment-item.component.html',
  styleUrls: ['./comment-item.component.scss']
})
export class CommentItemComponent implements OnInit {

  @Input() comment: Comment;

  @Output() deletedComment = new EventEmitter();

  user: User;
  canEdit: boolean = false;
  canDelete: boolean = false;
  date: string;
  hideEdit: boolean = true;
  editText: string;
  error: string = "";

  constructor(private authService : AuthService, private cookieService: CookieService, private commentService : CommentService) { }

  ngOnInit(): void {
    this.date = this.comment.created_at.toString().slice(0, -3);

    if(this.cookieService.get('role') == "admin"){
      this.canDelete = true;
    }

    this.authService.getUser(this.comment.user_id).subscribe(res => {
      this.user = res;

      let user_id = JSON.parse(this.cookieService.get('user')).id;
      if(res.id == user_id){
        this.canEdit = true;
        this.canDelete = true;
      }
    })
  }

  showEdit(){
    this.hideEdit = false;
    this.editText = this.comment.text;
  }

  edit(){
    if(this.editText == ""){
      this.error = "Can't save an empty comment!"
    }else{
      let newComment = {
        id: this.comment.id,
        text: this.editText,
        user_id: this.comment.user_id,
        movie_id: this.comment.movie_id,
        review_id: this.comment.review_id
      }

      this.commentService.updateComment(newComment).subscribe(res => {
        if(res){
          this.comment.text = this.editText;
          this.hideEdit = true;
        }else{
          alert("There was a problem. Try again later.")
        }
      });
    }
  }

  delete(){
    if (window.confirm("Permanently delete comment?")) {
      this.commentService.deleteComment(this.comment.id).subscribe(res => {
        this.deletedComment.emit()
      });
    }
  }

}
