import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { User } from '../models/user.model';
import { ApiService } from 'src/app/api/api.service';

const JWT_LOCALSTORE_KEY = 'jwt';
const USER_LOCALSTORE_KEY = 'user';

@Injectable({
	providedIn: 'root',
})
export class AuthService {
	currentUser$: BehaviorSubject<User> = new BehaviorSubject<User>(null);
	constructor(private api: ApiService) {
		this.initToken();
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	initToken() {
		const token = localStorage.getItem(JWT_LOCALSTORE_KEY);
		// eslint-disable-next-line @typescript-eslint/consistent-type-assertions
		const user = <User>(
			JSON.parse(localStorage.getItem(USER_LOCALSTORE_KEY))
		);
		if (token && user) {
			this.setTokenAndUser(token, user);
		}
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	setTokenAndUser(token: string, user: User) {
		localStorage.setItem(JWT_LOCALSTORE_KEY, token);
		localStorage.setItem(USER_LOCALSTORE_KEY, JSON.stringify(user));
		this.api.setAuthToken(token);
		this.currentUser$.next(user);
	}

	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	async login(email: string, password: string): Promise<any> {
		return this.api
			.post('/users/auth/login', { email: email, password: password })
			.then((res) => {
				this.setTokenAndUser(res.token, res.user);
				return res;
			})
			.catch((e) => {
				throw e;
			});
		// return user !== undefined;
	}

	logout(): boolean {
		this.setTokenAndUser(null, null);
		return true;
	}

	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	register(user: User, password: string): Promise<any> {
		return this.api
			.post('/users/auth/', { email: user.email, password: password })
			.then((res) => {
				this.setTokenAndUser(res.token, res.user);
				return res;
			})
			.catch((e) => {
				throw e;
			});
	}
}
