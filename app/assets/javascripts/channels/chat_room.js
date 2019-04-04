(function() {
  $(document).on('turbolinks:load', function() {
    var container = $('.js-messaging-container');
    if (!container.length) {
      return 0;
    }
    
    var chatRoomId = container.data('chatRoomId');

    App.chat_room_client = App.cable.subscriptions.create({
      channel: "ChatRoomChannel",
      chat_room_id: chatRoomId
    }, {
      connected: function() {

      },
      disconnected: function() {

      },
      received: function(data) {
        
      }
    });
  });
}).call(this);
