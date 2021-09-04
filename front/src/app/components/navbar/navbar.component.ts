import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {

  constructor(private cookieService: CookieService, private authService: AuthService) { }

  ngOnInit(): void {
  }

  isLoggedIn(){
    if(this.cookieService.get('role')){
      return true
    }

    return false
  }

  isAdmin(){
    if(this.isLoggedIn()){
      if(this.cookieService.get('role') == "admin"){
        return true
      }
    }

    return false
  }

  onLogout(){
    this.authService.logout();
  }

}
