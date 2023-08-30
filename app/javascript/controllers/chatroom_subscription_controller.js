import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messagesList"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.messagesListTarget.dataset.chatroom},
      { received: (data) => {
        this.messagesListTarget.insertAdjacentHTML('beforeend', data)
      }})
  }
}
