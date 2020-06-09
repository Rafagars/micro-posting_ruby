import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "body", "characterCount" ]

    initialize() {
        this.update()
        console.log('update')
    }

    update() {
        console.log('It enter the function')
        let message = ''
        let count = this.bodyTarget.value.length
        if (count == 1){
             message = "1 character"
        } else {
             message = `${count} characters`
        }

        this.characterCountTarget.textContent = message

        if (count > 300){
            this.characterCountTarget.classList.add("text-danger")
        } else {
            this.characterCountTarget.classList.remove("text-danger")
        }
    }

    submit(event) {
        let count = this.bodyTarget.value.length;
        if (count > 300 ){
            event.preventDefault();
        }
    }
}