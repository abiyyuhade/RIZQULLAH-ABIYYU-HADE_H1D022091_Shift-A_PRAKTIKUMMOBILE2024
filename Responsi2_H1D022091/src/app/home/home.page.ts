import { Component } from '@angular/core';
import { RaceService } from '../services/race.service';
import { AuthService } from '../services/auth.service'; 
import { Router } from '@angular/router'; 

@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage {
  races: any[] = [];

  constructor(
    private raceService: RaceService,
    private authService: AuthService, 
    private router: Router 
  ) {
    this.loadRaces();
  }

  loadRaces() {
    this.raceService.getRaces().subscribe({
      next: (data: any[]) => {
        this.races = data;
      },
      error: (err) => {
        console.error('Error fetching races:', err);
      },
    });
  }

  logout() {
    this.authService.logout().then(() => {
      this.router.navigate(['/login']);
    }).catch((err) => {
      console.error('Error during logout:', err);
    });
  }
}
