import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dialog"]

  connect() {
  }

  openDialog() {
    this.dialogTarget.showModal()
    document.body.classList.add("overflow-hidden")
  }

  closeDialog() {
    this.dialogTarget.close()
    document.body.classList.remove("overflow-hidden")
  }

  clickOutsideDialog(event) {
    if (event.target === this.dialogTarget) {
      this.closeDialog()
    }
  }
}
