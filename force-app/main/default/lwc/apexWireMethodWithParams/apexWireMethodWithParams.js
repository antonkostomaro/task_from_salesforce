import { LightningElement, wire } from "lwc";
import findTodos from "@salesforce/apex/TodosController.findTodos";

const DELAY = 300;

export default class ApexWireMethodWithParams extends LightningElement {
  searchKey = "";

  @wire(findTodos, { searchKey: "$searchKey" })
  todos;

  handleKeyChange(event) {
    window.clearTimeout(this.delayTimeout);
    const searchKey = event.target.value;
    this.delayTimeout = setTimeout(() => {
      this.searchKey = searchKey;
    }, DELAY);
  }
}