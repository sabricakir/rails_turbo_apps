import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-select-all"
export default class extends Controller {
  static targets = [ "parent", "child" ]
  connect() {

  }

  toggleChildren() {
    this.childTargets.map( x => x.checked = this.parentTarget.checked )
  }

  toggleParent() {
    this.parentTarget.checked = this.childTargets.every( x => x.checked )
  }
}
