import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  static targets = [ "content" ]
  connect() {
    useClickOutside(this)
  }

  clickOutside(event) {
    this.close()
  }

  closeOnBigScreen() {
    if(window.innerWidth > 768) {
      this.close()
    }
  }

  closeWithEsc(event) {
    if(event.keyCode == 27) {
      this.close()
    }
  }

  toggle() {
    if(this.contentTarget.classList.contains('hidden')) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    this.contentTarget.classList.remove('hidden')
    let main = document.querySelector('main')
    main.classList.add('blur-sm')
    document.body.classList.add('overflow-hidden')
  }

  close() {
    this.contentTarget.classList.add('hidden')
    let main = document.querySelector('main')
    main.classList.remove('blur-sm')
    document.body.classList.remove('overflow-hidden')
  }
}
