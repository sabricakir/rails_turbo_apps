import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="title-blink"
export default class extends Controller {
  static values = { newTitle: String }
  connect() {
    var newTitle = this.newTitleValue
    var oldTitle = document.title
    var blink = function() { document.title = document.title == newTitle ? oldTitle : newTitle }
    this.blinkInterval = setInterval(blink, 1000)
  }

  disconnect() {
    clearInterval(this.blinkInterval)
  }
}
