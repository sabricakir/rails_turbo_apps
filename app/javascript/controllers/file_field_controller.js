import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input', 'fileList', 'template']

  connect() {
  }

  openInput() {
    this.inputTarget.click()
  }

  listFiles() {
    this.fileListTarget.innerHTML = ''
    for(let i = 0; i < this.inputTarget.files.length; i++) {
      const file = this.inputTarget.files[i]
      const clone = document.importNode(this.templateTarget, true)
      clone.classList.remove('hidden')
      clone.dataset.fileIndex = i
      clone.querySelector('#fileName').textContent = file.name
      clone.querySelector('#fileSize').textContent = `${Math.round(file.size/1024)} KB`
      this.fileListTarget.insertAdjacentElement('beforeend', clone)
    }
  }
}