import { Component } from '@angular/core';

import { Platform } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { environment } from '../environments/environment';

@Component({
	selector: 'app-root',
	templateUrl: 'app.component.html',
})
export class AppComponent {
	public appPages = [
		{
			title: 'Home',
			url: '/home',
			icon: 'home',
		},
	];

	public appName = environment.appName;

	constructor(
		private platform: Platform,
		private splashScreen: SplashScreen,
		private statusBar: StatusBar
	) {
		this.initializeApp();
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	initializeApp() {
		this.platform.ready().then(() => {
			this.statusBar.styleDefault();
			this.splashScreen.hide();
			document.title = environment.appName;
		});
	}
}
