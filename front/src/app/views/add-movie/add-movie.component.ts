import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-add-movie',
  templateUrl: './add-movie.component.html',
  styleUrls: ['./add-movie.component.scss']
})
export class AddMovieComponent implements OnInit {

  title: String;
  genre: String;
  director: String;
  stars: String;
  releaseDate: String;
  imgUrl: String;
  videoUrl: String;
  description: String;
  trending: boolean;

  error: string = '';

  constructor(private movieService: MovieService, private router: Router) { }

  ngOnInit(): void {
  }

  addMovie(){
    if(this.title == undefined || this.genre == undefined || this.director == undefined || this.stars == undefined || this.releaseDate == undefined || this.imgUrl == undefined || this.videoUrl == undefined || this.description == undefined ){
      this.error = "All fields have to be filled out "
      return;
    }
    if(this.title == '' || this.genre == '' || this.director == '' || this.stars == '' || this.releaseDate == '' || this.imgUrl == '' || this.videoUrl == '' || this.description == '' ){
      this.error = "All fields have to be filled out "
      return;
    }

    let newMovie = {
      title: this.title,
      genre: this.genre,
      director: this.director,
      stars: this.stars,
      release_date: this.releaseDate,
      img_url: this.imgUrl,
      video_url: this.videoUrl,
      description: this.description,
      trending: (this.trending ? 1 : 0)
    }

    this.movieService.addMovie(newMovie).subscribe(res => {
      if(res){
        this.router.navigate(['/movie/'+res.id])
      }
    })
  }

}
