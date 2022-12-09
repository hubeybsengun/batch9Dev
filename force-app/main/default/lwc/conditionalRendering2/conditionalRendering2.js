import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    showContent = false;
    handleClick(event){
        this.showContent = true;
    }
}