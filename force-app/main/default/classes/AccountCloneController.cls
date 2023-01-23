public class AccountCloneController {

    static final String SELECT_CLAUSE = 'SELECT ';
    static final String  WHERE_CLAUSE = 'WHERE ';
    
    @AuraEnabled(cacheable=true)
    Public Static Account getFieldSetFromAccount(String accId){
        List<Schema.FieldSetMember> getFieldSet = SobjectType.Account.FieldSets.Account_FieldSet.getFields();
        List<String> ListToAddFieldSet = new List<String>();
        try {
            for(FieldSetMember FieldSet : getFieldSet){
                ListToAddFieldSet.add(String.valueOf(FieldSet.sobjectField));
            }
            String query = SELECT_CLAUSE + String.join(ListToAddFieldSet, ',');
            query += ' FROM Account '+ WHERE_CLAUSE + 'Id =:accId';
            System.debug('The Query -------------------'+query);
            return Database.query(query);
        }catch(Exception e){
            System.debug('The Error : '+e.getMessage());
            System.debug('The Error Line : '+e.getLineNumber());
        }
        return null;
    }
    
    /*
     LWC:

JS File:

import { LightningElement, wire, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import getFieldSetFromAccount from '@salesforce/apex/AccountCloneController.getFieldSetFromAccount';

export default class AccountCustomClone extends NavigationMixin(LightningElement) {
    @api recordId;
    @wire(getFieldSetFromAccount, { accId: '$recordId' })
    getOppRecords({ error, data }) {
        debugger;
        console.log('data====', data);
        if (data != null) {
            this.datafromMethod(data);

        } else {
            console.log('The Error --> ' + error);
        }
    }
    datafromMethod(datJSON) {
        const defaultValues = encodeDefaultFieldValues(datJSON);
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaultValues
            }
        });
    }
}

XML

<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>52.0</apiVersion>
    <isExposed>true</isExposed>
    <targets>
        <target>lightning__RecordAction</target>
        <target>lightning__RecordPage</target>
    </targets>
    <targetConfigs>
        <targetConfig targets="lightning__RecordAction">
            <actionType>ScreenAction</actionType>
        </targetConfig>
    </targetConfigs>
</LightningComponentBundle>

     */
}