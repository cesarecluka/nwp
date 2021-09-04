import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../models/User';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient, private cookieService: CookieService) { }

  getUser(id: number){
    return this.http.get<User>('http://localhost:8000/api/user/'+id)
  }

  register(user: {}){
    return this.http.post('http://localhost:8000/api/register', user);
  }

  login(user: {}){
    return this.http.post<User>('http://localhost:8000/api/login', user);
  }

  logout(){
    this.cookieService.deleteAll();
  }
}
