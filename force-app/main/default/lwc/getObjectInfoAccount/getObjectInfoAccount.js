// Task: LWC to fetch ACcount Metadata Information
// Solution/Approach : Using UI API to acheive it
// JS : Step 1 - import UI Apis
// Step 2 - Wire decorator to get schema details
// HTML : Step 3 - Display the metadata information whatever we got from JS
// Metadat: Step 4 - Expose LWC to Apppages/Homepages

// LWC world - 3 decorators - track (to make datatypes reactive), wire (it will interact with ui apis/apex/any server resources), api (public attribute)

//  Decorators (track, api, wire) are always imported from LWC featureset
import { LightningElement, track, api, wire  } from 'lwc';
// Imported User Interface APi -- ObjectInfoApi
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
// Imported Account Object info
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetObjectInfoAccount extends LightningElement {

    // Local JS properties
    recordTypeId;
    idPrefix;
    fields;
    error;

    // Invoke Wire decorator to make Server interaction
    // In this scenario, Server Interaction is happening with use of UI APis
    // In future, we will use Wire to interact with Apex (Server resource)
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
        // Link Wire decorator with either JS method/function or Local properties
        // In this csenario, we will tacch it with JS method
        accountInfoHandler({ data, error }){
            // Condition Expression -- Null Check
            if(data){
                console.log(data);
                // Extracting useful information from UI Api response, i.e., Account metadata
                this.recordTypeId = data.defaultRecordTypeId;
                this.idPrefix = data.keyPrefix;
                this.fields = data.fields;
            }else{
                console.log(error);
                this.error = error;
            }
        }

}