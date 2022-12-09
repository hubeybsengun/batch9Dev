import { LightningElement } from 'lwc';

import CASE_OBJECT from '@salesforce/schema/Case';
import Subject_FIELD from '@salesforce/schema/Case.Subject';
import Priority_FIELD from '@salesforce/schema/Case.Priority';
import Status_FIELD from '@salesforce/schema/Case.Status';
import CaseNumber_FIELD from '@salesforce/schema/Case.CaseNumber';

export default class RecordFormCase extends LightningElement { 
    objectName = CASE_OBJECT;
    fields= [
        Subject_FIELD,Priority_FIELD,Status_FIELD,CaseNumber_FIELD
    ];
}


