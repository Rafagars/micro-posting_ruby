import { Controller } from "stimulus"

//Toggle the class for the like button

export default class extends Controller {
    like(){
        this.element.classList.remove('far');
        this.element.classList.add('fas');
    }

    unlike(){
        this.element.classList.remove('fas');
        this.element.classList.add('far');
    }
}