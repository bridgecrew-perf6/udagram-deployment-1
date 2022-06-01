import { Injectable } from '@angular/core';
import {
	Router,
	CanActivate,
	RouterStateSnapshot,
	ActivatedRouteSnapshot,
	UrlTree,
} from '@angular/router';
import { AuthService } from './auth.service';
import { Observable } from 'rxjs';

@Injectable({
	providedIn: 'root',
})
export class AuthGuardService implements CanActivate {
	constructor(private auth: AuthService, private router: Router) {}

	canActivate(
		// eslint-disable-next-line @typescript-eslint/no-unused-vars
		_route: ActivatedRouteSnapshot,
		// eslint-disable-next-line @typescript-eslint/no-unused-vars
		_state: RouterStateSnapshot
	):
		| boolean
		| UrlTree
		| Observable<boolean | UrlTree>
		| Promise<boolean | UrlTree> {
		if (!this.auth.currentUser$.value) {
			this.router.navigateByUrl('/login');
		}

		return this.auth.currentUser$.value !== null;
	}
}
