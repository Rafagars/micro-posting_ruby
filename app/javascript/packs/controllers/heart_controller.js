import { Controller } from "stimulus"

//Toggle the class for the like button

export default class extends Controller {
    like(){
        this.element.classList.toggle('far');
    }
}