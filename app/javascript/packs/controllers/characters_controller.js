import { Controller } from "stimulus"

//Show the number of characaters the user has typed in the text field

export default class extends Controller {
    static targets = [ "body", "characterCount" ]

    initialize() {
        this.update()

    }

    update() {

        let count = this.bodyTarget.value.length

        this.characterCountTarget.textContent = `${count}/300 characters`

        if (count > 300){
            this.characterCountTarget.classList.add("text-danger")
        } else {
            this.characterCountTarget.classList.remove("text-danger")
        }
    }

    submit(event) {
        let count = this.bodyTarget.value.length;
        if (count > 300 || count === 0){
            event.preventDefault();
        }
    }
}