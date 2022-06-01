import { Component, OnInit, OnDestroy } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { FeedUploadComponent } from '../feed-upload.component';
import { AuthService } from 'src/app/auth/services/auth.service';
import { Subscription } from 'rxjs';

@Component({
	selector: 'app-feed-upload-button',
	templateUrl: './feed-upload-button.component.html',
	styleUrls: ['./feed-upload-button.component.scss'],
})
export class FeedUploadButtonComponent implements OnInit, OnDestroy {
	isLoggedIn: boolean;
	loginSub: Subscription;

	constructor(
		private modalController: ModalController,
		private auth: AuthService
	) {}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	ngOnInit() {
		this.auth.currentUser$.subscribe((user) => {
			this.isLoggedIn = user !== null;
		});
	}

	ngOnDestroy(): void {
		if (this.loginSub) {
			this.loginSub.unsubscribe();
		}
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	async presentUploadForm() {
		const modal = await this.modalController.create({
			component: FeedUploadComponent,
		});
		return await modal.present();
	}
}
