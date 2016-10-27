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

    var offlineUser = $('#' + data['offline_user']);
    offlineUser.remove();

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

$(document).on('click', '[data-behavior~=send_message]', function(event) {
  var message = $('[data-behavior~=room_speaker]').val(); 
  App.room.speak(message);
  $('[data-behavior~=room_speaker]').val('');
  $('[data-behavior~=room_speaker]').focus();
  event.preventDefault();
});

