import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import {Router} from "@angular/router"
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  username: string;
  password: string;
  error: string = ''

  constructor(private authService: AuthService, private router: Router, private cookieService: CookieService) { }

  ngOnInit(): void {
  }

  onSubmit(){

    const user = {
      username: this.username,
      password: this.password
    };

    this.authService.login(user).subscribe(res => {
      if(res){
        this.cookieService.set('user', JSON.stringify(res))
        this.cookieService.set('role', res.role)
        this.router.navigate(['/'])
      }else{
        this.error = "Incorrect username or password"
      }
    })
  }

}
