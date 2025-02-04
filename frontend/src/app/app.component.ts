import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss' 
  
})
export class AppComponent implements OnInit {
  title = 'weer';
  weer: any;

  constructor(private http: HttpClient) {

  }

  ngOnInit(): void {
    this.http.get('/api/weatherforecast/').subscribe(data => {
      this.weer = data;
    });
  }
}
