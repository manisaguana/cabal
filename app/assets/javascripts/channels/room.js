App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    console.log("This is from the javascript connection This is from the javascript connection This is from the javascript connection");
  },

  disconnected: function() {
    console.log("This is from the javascript disconnection This is from the javascript disconnection This is from the javascript disconnection");
  },

  received: function(data) {
    $('.chat-box').append(data['message']);
    $('.chat-box').scrollTop(1000000);
  },

  speak: function(message) {
    return this.perform('speak', {
      message: message 
    });
  }
  
});

$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode === 13) {
    App.room.speak(event.target.value);
    event.target.value = '';
    event.preventDefault();
  }
});
