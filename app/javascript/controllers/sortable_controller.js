import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
        onEnd: this.onEnd.bind(this)
    })
  }
  onEnd(event) {
    //console.log(event.newIndex)
    console.log(event.item.dataset.sortableId)
  }
}
