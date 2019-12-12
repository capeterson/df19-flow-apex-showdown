import { LightningElement, api} from 'lwc';
import { FlowAttributeChangeEvent } from 'lightning/flowSupport';

export default class visualpicker extends LightningElement {
    @api label;
    @api records = [];
 
    @api
    get value(){
        return this._value;
    }
    set value(value){
        this._value = value;
    }
    _value = 'initialValue';



    handleOptionSelected(event){
        this._value = event.target.value;
        const attributeChangeEvent = new FlowAttributeChangeEvent('value', this._value);
        this.dispatchEvent(attributeChangeEvent);
    }
}