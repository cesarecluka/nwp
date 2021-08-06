export interface Comment{
  id? : number;
  text : string;
  user_id : number;
  post_id? : number;
  review_id? : number;
  created_at : Date;
}

