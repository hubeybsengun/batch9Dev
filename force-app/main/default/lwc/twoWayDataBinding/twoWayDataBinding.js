import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    name='';
    label='Enter Name';
    handleChange(event){
        console.log(JSON.stringify(event.target.value));
        this.name = event.target.value;
    }
}