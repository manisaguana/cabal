App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
  },

  disconnected: function() {
  },

  received: function(data) {
    $('.chat-box').append(data['message']);
    $('.chat-box').scrollTop(1000000);
    $('.online_users_list').append(data['user']);

    var user = $('#' + data['user_id']);
    user.next().next().remove();
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
