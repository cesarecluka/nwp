import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { RouterModule, Routes } from '@angular/router';

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

const appRoutes: Routes = [
  { path: '', component: MoviesComponent },
  { path: 'about', component: AboutComponent },
  { path: 'reviews', component: ReviewsComponent },
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
    LoginComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot(appRoutes, { enableTracing: true }),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
