import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import { Movie } from 'src/app/models/Movie';
import { MovieService } from 'src/app/services/movie.service';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-movie',
  templateUrl: './movie.component.html',
  styleUrls: ['./movie.component.scss']
})
export class MovieComponent implements OnInit {
  movie: Movie;
  video_url: any;

  constructor(private route:ActivatedRoute, private movieService: MovieService, private dom:DomSanitizer)  {  }

  ngOnInit(): void {
    this.getMovie();
  }

  getMovie(){
    this.movieService.getMovie(Number(this.route.snapshot.paramMap.get('movie_id'))).subscribe(res => {
      this.movie = res;
      this.video_url=this.dom.bypassSecurityTrustResourceUrl(res.video_url);
    })
  }
}
