(function() {
  $(document).on('turbolinks:load', function() {
    var container = $('.js-messaging-container');
    if (!container.length) {
      return 0;
    }
    
    var chatRoomId = container.data('chatRoomId');

    App.chat_room_client = App.cable.subscriptions.create({
      channel: 'ChatRoomChannel',
      chat_room_id: chatRoomId
    }, {
      connected: function() {

      },
      disconnected: function() {

      },
      received: function(data) {
        
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
