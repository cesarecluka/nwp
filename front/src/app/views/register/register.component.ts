import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import {Router} from "@angular/router"

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  username: string;
  email: string;
  password: string;
  password_confirm: string;
  error: string = ''

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
  }

  onSubmit(){
    if(this.username == '' || this.email == '' || this.password == '' || this.password_confirm == ''){
      this.error = 'All fields have to be filled out'
      return;
    }

    if(this.password != this.password_confirm){
      this.error = "Passwords don't match"
      return;
    }

    const user = {
      username: this.username,
      email: this.email,
      password: this.password
    };
    if(this.authService.register(user)){
      this.router.navigate(['/login'])
    }
  }

}
