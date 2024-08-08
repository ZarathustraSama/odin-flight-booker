import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["passenger"]

  add() {
    const template = document.getElementById("passenger-template");
    const clone = document.importNode(template.content, true).firstElementChild;
    const newIndex = document.getElementsByClassName("passenger").length;
    clone.innerHTML = clone.innerHTML.replace(/\d+/g, newIndex);
    this.passengerTarget.appendChild(clone);
  };

  remove() {
    if (document.getElementsByClassName("passenger").length > 1)
      this.passengerTarget.parentNode.removeChild(this.passengerTarget)
  };
}
