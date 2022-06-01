import { Component, OnInit } from '@angular/core';
import {
	Validators,
	FormBuilder,
	FormGroup,
	FormControl,
} from '@angular/forms';

import { ModalController } from '@ionic/angular';

import { AuthService } from '../services/auth.service';

@Component({
	selector: 'app-auth-login',
	templateUrl: './auth-login.component.html',
	styleUrls: ['./auth-login.component.scss'],
})
export class AuthLoginComponent implements OnInit {
	loginForm: FormGroup;
	error: string;

	constructor(
		private formBuilder: FormBuilder,
		private auth: AuthService,
		private modal: ModalController
	) {}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	ngOnInit() {
		this.loginForm = this.formBuilder.group({
			password: new FormControl('', Validators.required),
			email: new FormControl(
				'',
				Validators.compose([
					Validators.required,
					Validators.pattern(
						'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$'
					),
				])
			),
		});
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	async onSubmit($event) {
		$event.preventDefault();

		if (!this.loginForm.valid) {
			return;
		}

		this.auth
			.login(
				this.loginForm.controls.email.value,
				this.loginForm.controls.password.value
			)
			.then(() => {
				this.modal.dismiss();
			})
			.catch((e) => {
				this.error = e.statusText;
				throw e;
			});
	}
}
