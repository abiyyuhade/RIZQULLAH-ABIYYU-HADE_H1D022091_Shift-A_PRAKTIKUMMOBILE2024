import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import { AuthService } from './auth.service';
import { Observable } from 'rxjs';
import { switchMap } from 'rxjs/operators';
import { from } from 'rxjs'; 

@Injectable({
  providedIn: 'root',
})
export class RaceService {
  constructor(
    private firestore: AngularFirestore,
    private authService: AuthService
  ) {}

  addRace(race: any) {
    return this.authService.getUser().pipe(
      switchMap((user) => {
        if (user) {
          race.userId = user.uid;
          return this.firestore.collection('races').add(race);
        } else {
          throw new Error('User not authenticated');
        }
      })
    );
  }

  getRaces(): Observable<any[]> {
    return this.authService.getUser().pipe(
      switchMap((user) => {
        if (user) {
          return this.firestore
            .collection('races', (ref) => ref.where('userId', '==', user.uid))
            .valueChanges({ idField: 'id' }); 
        } else {
          return [];
        }
      })
    );
  }

  getRaceById(raceId: string): Observable<any> {
    return this.firestore.collection('races').doc(raceId).valueChanges();
  }

  updateRace(raceId: string, race: any): Observable<any> {
    return from(this.firestore.collection('races').doc(raceId).update(race)); // Mengubah Promise menjadi Observable
  }

  deleteRace(raceId: string): Observable<any> {
    return from(this.firestore.collection('races').doc(raceId).delete()); // Mengubah Promise menjadi Observable
  }
}
