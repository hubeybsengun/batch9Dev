import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {
    titles = ['Developer','Admin','Business Anlyst','Architect','QA Tester','Project Manager'];

    num1 = 1;
    num2 = 2;
    //sum = this.num1 + this.num2;
    //mytitle = this.titles[2];

    get summation(){
        return this.num1 + this.num2;
    }

    get desiredTitle(){
        return this.titles[2];
    }
}