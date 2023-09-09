import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hotkeys"
export default class extends Controller {
  static targets = ["button"]

  connect() {}
  
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
