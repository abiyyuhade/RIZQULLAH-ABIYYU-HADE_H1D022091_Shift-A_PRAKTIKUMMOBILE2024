import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { RaceService } from '../services/race.service';

@Component({
  selector: 'app-add-race',
  templateUrl: './add-race.page.html',
  styleUrls: ['./add-race.page.scss'],
})
export class AddRacePage {
  race = { 
    name: '', 
    description: '', 
    date: '', 
    trackName: '', 
    trackLength: '', 
    trackType: '' 
  };

  constructor(private raceService: RaceService, private router: Router) {}

  addRace() {
    if (!this.race.name || !this.race.description || !this.race.date || !this.race.trackName || !this.race.trackLength || !this.race.trackType) {
      console.error('Race data is incomplete');
      alert('Please fill in all fields');
      return;
    }

    console.log('addRace called', this.race);

    this.raceService.addRace(this.race).subscribe({
      next: () => {
        console.log('Race added successfully');
        this.router.navigate(['/home']);
      },
      error: (err) => {
        console.error('Error adding race:', err);
        alert('An error occurred while adding the race');
      }
    });
  }
}
