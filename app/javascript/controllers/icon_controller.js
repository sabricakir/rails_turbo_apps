import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="icon"
export default class extends Controller {
  static targets = [ "iconElement" ]
  connect() {
  }

  addSpinAnimation() {
    this.iconElementTarget.classList.add("animate-spin")
    setTimeout(() => {
      this.iconElementTarget.classList.remove("animate-spin")
    }, 1000)
  }
}
