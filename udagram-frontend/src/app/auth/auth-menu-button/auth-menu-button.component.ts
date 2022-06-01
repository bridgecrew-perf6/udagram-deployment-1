import { Component, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { AuthMenuUserComponent } from './auth-menu-user/auth-menu-user.component';

import { AuthService } from '../services/auth.service';
import { AuthLoginComponent } from '../auth-login/auth-login.component';
import { AuthRegisterComponent } from '../auth-register/auth-register.component';

@Component({
	selector: 'app-auth-menu-button',
	templateUrl: './auth-menu-button.component.html',
	styleUrls: ['./auth-menu-button.component.scss'],
})
export class AuthMenuButtonComponent implements OnInit {
	constructor(
		private auth: AuthService,
		public modalController: ModalController
	) {}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	async presentmodal() {
		const modal = await this.modalController.create({
			component: AuthMenuUserComponent,
		});
		return await modal.present();
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	async presentLogin() {
		const modal = await this.modalController.create({
			component: AuthLoginComponent,
		});
		return await modal.present();
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	async presentRegister() {
		const modal = await this.modalController.create({
			component: AuthRegisterComponent,
		});
		return await modal.present();
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	logout() {
		this.auth.logout();
	}

	// eslint-disable-next-line @typescript-eslint/no-empty-function
	ngOnInit() {} // eslint-disable-line @typescript-eslint/explicit-function-return-type
}
