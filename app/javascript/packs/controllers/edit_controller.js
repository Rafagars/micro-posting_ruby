import { Controller } from "stimulus"

// Shows form without redirecting

export default class extends Controller{
    static targets = ["body", "form"]

    toggle(event) {
    	event.preventDefault();
        this.bodyTarget.classList.toggle('d-none');
        this.formTarget.parentNode.classList.toggle('d-none');
    }
}