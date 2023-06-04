import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'

// Connects to data-controller="advanced-select"
export default class extends Controller {
  connect() {
    new SlimSelect({
      select: this.element,
      closeOnSelect: false
    })
  }
}
