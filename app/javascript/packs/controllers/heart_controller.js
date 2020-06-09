import { Controller } from "stimulus"

export default class extends Controller {
    like(){
        this.element.classList.toggle('far');
    }
}