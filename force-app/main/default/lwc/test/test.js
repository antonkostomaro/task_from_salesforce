import { LightningElement } from 'lwc';
import getImage from '@salesforce/apex/c/testController.c'

export default class Test extends LightningElement {
    imageUrl;
    handleclick(){
        getImage()
        .then(result =>{
            this.imageUrl = result;
        })
    }
}