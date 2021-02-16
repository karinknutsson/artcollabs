import consumer from "./consumer";

const initProjectChatCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.projectchatId;

    consumer.subscriptions.create({ channel: "ProjectChatChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initProjectChatCable };

consumer.subscriptions.create({ channel: "ProjectChatChannel", id: id }, {
  received(data) {
    messagesContainer.insertAdjacentHTML('beforeend', data);
  }
});
