import { Component, OnInit } from '@angular/core';
import { environment } from '../../environments/environment';

@Component({
	selector: 'app-menubar',
	templateUrl: './menubar.component.html',
	styleUrls: ['./menubar.component.scss'],
})
export class MenubarComponent implements OnInit {
	public appName = environment.appName;

	// eslint-disable-next-line @typescript-eslint/no-empty-function
	constructor() {}

	// eslint-disable-next-line @typescript-eslint/no-empty-function
	ngOnInit() {} // eslint-disable-line @typescript-eslint/explicit-function-return-type
}
