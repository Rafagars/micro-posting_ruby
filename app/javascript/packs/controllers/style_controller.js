import { Controller } from 'stimulus';

export default class extends Controller {

    initialize() {
        this.update()
    }

    update() {
        const currentTheme = localStorage.getItem("theme");

        // If the current theme in localStorage is "dark"...
        if (currentTheme === "dark") {
            // ...then use the .dark-theme class
            this.element.classList.add("dark-theme");
        }
    }

    mode(){
        this.element.classList.toggle('dark-theme');
        // Let's say the theme is equal to light
        let theme = "light";
        // If the body contains the .dark-theme class...
        if (this.element.classList.contains("dark-theme")) {
            // ...then let's make the theme dark
            theme = "dark";
        }
        // Then save the choice in localStorage
        localStorage.setItem("theme", theme)
    }
}