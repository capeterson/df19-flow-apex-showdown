import { LightningElement, track } from 'lwc';

const INTEGRATION_URL =
    'https://pbojinov.github.io/iframe-communication/iframe.html';
//'https://davidwalsh.name/demo/windowPostMessageListener.html';

export default class IntegrationComponent extends LightningElement {
    @track navigateTo;
    @track messageFromPage;

    constructor() {
        super();
        window.addEventListener('message', this.listenForMessage.bind(this));
    }

    doIntegration() {
        this.navigateTo = INTEGRATION_URL;
    }

    frameLoaded(evt) {
        var e = evt;
        window.console.log(e.target.getAttribute('src') + ' loaded');
        if (e.target.getAttribute('src') === INTEGRATION_URL) {
            // You know that your captcha is loaded
        }
    }

    listenForMessage(message) {
        this.messageFromPage = message.data;
        window.console.log('messageFromPage ' + message.data);
    }
}
