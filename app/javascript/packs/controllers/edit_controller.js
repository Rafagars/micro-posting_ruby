import { Controller } from "stimulus"

export default class extends Controller{
    static targets = ["body", "form"]

    toggle() {
        console.log(this.formTarget)
        this.bodyTarget.classList.toggle('d-none');
        this.formTarget.parentNode.classList.toggle('d-none');
    }
}