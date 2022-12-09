import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    employeeName = 'Omer';
    experience = 1;
    fruits = ['Apple', 'Orange', 'Grape','Cherry'];
    oddNumbers = [3, 5, 7, 9];
    location = {
        city : 'Ottawa',
        country : 'Canada' ,
        state : 'Ontario'
    }
}