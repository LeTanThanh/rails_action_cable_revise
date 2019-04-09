(function() {
  $(document).on('turbolinks:load', function() {
    var container = $('.js-messaging-container');
    if (!container.length) {
      return 0;
    }
    
    var chatRoomId = container.data('chatRoomId');
    var userId = container.data('userId');

    App.chat_room_client = App.cable.subscriptions.create({
      channel: 'ChatRoomChannel',
      chat_room_id: chatRoomId
    }, {
      connected: function() {

      },
      disconnected: function() {

      },
      received: function(data) {
        if (userId == data['user_id']) {
          $('.js-msg_history').append(data['user_message']);
        } else {
          $('.js-msg_history').append(data['other_user_message']);
        }

        $('.js-inbox_chat').find('.js-message-chat-room-' + chatRoomId).remove();
        $('.js-inbox_chat').prepend(data['chat_room_with_newest_message']);

        activeMessage();
        scrollToLastMessage();
      },
      send_message: function(chatRoomId, messageContent) {
        this.perform('receive_message', {
          chat_room_id: chatRoomId,
          message_content:　messageContent
        })
      }
    });

    $('.js-btn-send-message').on('click', function() {
      var messageContent = $('.js-message-content').val();
      if (!messageContent.trim().length) {
        return 0;
      }

      App.chat_room_client.send_message(chatRoomId, messageContent);
      $('.js-message-content').val('');
    });
  });
}).call(this);
