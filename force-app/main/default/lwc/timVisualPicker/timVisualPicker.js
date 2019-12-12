import { LightningElement, track, api } from 'lwc';
/* import BATHING_LOGO from '@salesforce/resourceUrl/jhBathing';
import EATING_LOGO from '@salesforce/resourceUrl/jhEating';
import TRANSFERRING_LOGO from '@salesforce/resourceUrl/jhTransferring';
import DRESSING_LOGO from '@salesforce/resourceUrl/jhDressing';
import INDOOR_LOGO from '@salesforce/resourceUrl/jhIndoorMobility';
import OUTDOOR_LOGO from '@salesforce/resourceUrl/jhOutdoorMobility'; */

import BATHING_LOGO from '@salesforce/resourceUrl/bathing_1';
import EATING_LOGO from '@salesforce/resourceUrl/eating_1';
import TRANSFERRING_LOGO from '@salesforce/resourceUrl/transferring_1';
import DRESSING_LOGO from '@salesforce/resourceUrl/dressing_1';
import INDOOR_LOGO from '@salesforce/resourceUrl/indoor_mobi_1';
import OUTDOOR_LOGO from '@salesforce/resourceUrl/outdoor_mobi_1';

export default class picker extends LightningElement {
    @api bathingUrl = BATHING_LOGO;
    @api eatingUrl = EATING_LOGO;
    @api transferringUrl = TRANSFERRING_LOGO;
    @api dressingUrl = DRESSING_LOGO;
    @api indoorUrl = INDOOR_LOGO;
    @api outdoorUrl = OUTDOOR_LOGO;

    handleOptionSelected(event){

    }

}