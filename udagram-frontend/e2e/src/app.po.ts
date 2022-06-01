import { browser, by, element } from 'protractor';

export class AppPage {
	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	navigateTo(destination) {
		return browser.get(destination);
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	getTitle() {
		return browser.getTitle();
	}

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	getPageOneTitleText() {
		return element(by.tagName('app-home'))
			.element(by.deepCss('ion-title'))
			.getText();
	}
}
