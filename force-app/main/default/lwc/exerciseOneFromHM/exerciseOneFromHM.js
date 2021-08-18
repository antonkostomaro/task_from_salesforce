import { LightningElement } from 'lwc';
import getImage from '@salesforce/apex/ExerciseOneFromHMController.UploandServer'

export default class ExerciseOneFromHM extends LightningElement {
    imageUrl;
    handleclick(){
        getImage()
        .then(result =>{
            this.imageUrl = result;
        })
    }
}