import { LightningElement, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { refreshApex } from "@salesforce/apex";
import { deleteRecord } from "lightning/uiRecordApi";
import getTodoList from "@salesforce/apex/TodosController.getTodoList";


export default class LdsDeleteRecord extends LightningElement {
  todos;
  error;
  wiredTodosResult;

  @wire(getTodoList)
  wiredTodos(result) {
    this.wiredTodosResult = result;
    if (result.data) {
      this.todos = result.data;
      this.error = undefined;
    } else if (result.error) {
      this.error = result.error;
      this.todos = undefined;
    }
  }

  deleteTodo(event) {
    const recordId = event.target.dataset.recordid; //мы получаем доступ к значению выбранного идентификатора записи
    deleteRecord(recordId)
      .then(() => {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Success",
            message: "Todo deleted",
            variant: "success"
          })
        );
        return refreshApex(this.todos);
      })
     
  }
}