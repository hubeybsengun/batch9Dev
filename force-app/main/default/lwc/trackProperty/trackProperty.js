import { LightningElement, track } from 'lwc';

export default class TrackProperty extends LightningElement {

    titles = 'Architect';

    @track contact = {
        name : 'Omer',
        stay : 'Canada',
        title : 'Salesforce Developer'
    }

    handleChange(event){
        this.contact.title = event.target.value;
    }
}