import { Controller } from 'stimulus';

export default class extends Controller{
    static targets = ["bar"]
    toggle(){
       this.barTarget.classList.toggle('d-none'); 
    }
}