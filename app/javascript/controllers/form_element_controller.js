import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-element"
export default class extends Controller {
  static targets = [ "remoteButton" ]
  connect() {
    this.remoteButtonTarget.hidden = true
  }

  autoSubmit() {
    this.remoteButtonTarget.click()
  }
}
