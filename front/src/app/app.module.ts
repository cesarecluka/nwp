import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { RouterModule, Routes } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { AuthGuard } from './guards/auth.guard';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { MoviesComponent } from './views/movies/movies.component';
import { AboutComponent } from './views/about/about.component';
import { ReviewsComponent } from './views/reviews/reviews.component';
import { ContactComponent } from './views/contact/contact.component';
import { MovieItemComponent } from './components/movie-item/movie-item.component';
import { MoviesTrendingComponent } from './components/movies-trending/movies-trending.component';
import { RegisterComponent } from './views/register/register.component';
import { LoginComponent } from './views/login/login.component';
import { ReviewItemComponent } from './components/review-item/review-item.component';
import { MovieComponent } from './views/movie/movie.component';
import { ReviewComponent } from './views/review/review.component';
import { AddReviewComponent } from './views/add-review/add-review.component';
import { AddMovieComponent } from './views/add-movie/add-movie.component';
import { CommentsComponent } from './components/comments/comments/comments.component';
import { CommentItemComponent } from './components/comments/comment-item/comment-item.component';
import { FooterComponent } from './components/footer/footer.component';

const appRoutes: Routes = [
  { path: '', component: MoviesComponent },
  { path: 'movie/:movie_id', component: MovieComponent },
  { path: 'add-movie', component: AddMovieComponent },
  { path: 'about', component: AboutComponent },
  { path: 'reviews', component: ReviewsComponent },
  { path: 'review/:review_id', component: ReviewComponent },
  { path: 'add-review', component: AddReviewComponent, canActivate: [AuthGuard] },
  { path: 'contact', component: ContactComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'login', component: LoginComponent },
];

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    MoviesComponent,
    AboutComponent,
    ReviewsComponent,
    ContactComponent,
    MovieItemComponent,
    MoviesTrendingComponent,
    RegisterComponent,
    LoginComponent,
    ReviewItemComponent,
    MovieComponent,
    ReviewComponent,
    AddReviewComponent,
    AddMovieComponent,
    CommentsComponent,
    CommentItemComponent,
    FooterComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot(appRoutes, { enableTracing: true }),
  ],
  providers: [CookieService],
  bootstrap: [AppComponent]
})
export class AppModule { }
