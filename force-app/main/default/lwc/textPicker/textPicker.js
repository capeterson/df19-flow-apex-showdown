import { LightningElement, api} from 'lwc';
import { FlowAttributeChangeEvent } from 'lightning/flowSupport';


export default class picker extends LightningElement {
    @api option1 = 'option1';
    @api option2 = 'option2';
    @api option3 = 'option3';
    @api option4 = 'option4';
    @api option5 = 'option5';
    @api option6 = 'option6';


    @api
    get selectedOption(){
        return this._selectedOption;
    }
    set selectedOption(value){
        this._selectedOption = value;
    }
    _selectedOption = 'defaultValue';


    handleOptionSelected(event){
        debugger;
        this._selectedOption = event.target.value;
        const attributeChangeEvent = new FlowAttributeChangeEvent('selectedOption',this._selectedOption);
        this.dispatchEvent(attributeChangeEvent);
    }

}