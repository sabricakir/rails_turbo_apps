import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
    static targets = [ "moonIcon", "sunIcon" ]
  connect() {
    this.userTheme = localStorage.getItem("theme");
    this.systemTheme = window.matchMedia("(prefers-color-scheme: dark)").matches;
    this.themeCheck();
  }

  themeCheck() {
    if(this.userTheme === "dark" || (!this.userTheme && this.systemTheme)) {
      document.documentElement.classList.add("dark");
      this.moonIconTarget.classList.add("hidden");
    }
    else {
      this.sunIconTarget.classList.add("hidden");
    }
  }

  themeSwitch() {
    if(document.documentElement.classList.contains("dark")){
        document.documentElement.classList.remove("dark");
        localStorage.setItem("theme", "light");
        this.iconToggle();
    }
    else{
        document.documentElement.classList.add("dark");
        localStorage.setItem("theme", "dark");
        this.iconToggle();
    }
  }

  iconToggle() {
      this.moonIconTarget.classList.toggle("hidden");
      this.sunIconTarget.classList.toggle("hidden");
  }
}
