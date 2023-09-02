import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hotkeys"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    document.addEventListener("keydown", this.handleKeydown.bind(this))
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleKeydown.bind(this))
  }

  handleKeydown(event) {
    var pressedCtrl = event.ctrlKey || event.metaKey
    var pressedKey = event.key.toLowerCase()

    if(pressedCtrl){
      this.buttonTargets.forEach((button) => {
        if(button.dataset.hotkey === pressedKey){
          event.preventDefault()
          button.click()
        }
      });
    }
  }
}
