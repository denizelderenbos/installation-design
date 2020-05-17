var url = 'ws://192.168.2.9/ws';
var webSocket = new WebSocket(url);

console.log("webSocket", webSocket);

webSocket.onopen = function(event) {
  console.log("WebSocket connected");
};

webSocket.onmessage = function(event) {
  console.log("message received", event);
  try {
    console.log(JSON.parse(event.data));
  } catch (e) {
    console.log(event.data);
  }
};



$('#button').click(function(){
    $.ajax({
      url: 'http://192.168.2.9',
      cache: false,
      beforeSend: function(){
          console.log('sending');
      },
      success: function(data){
        try {
          console.log(JSON.parse(data));
        } catch (e) {
          console.log(data);
        }
      }
    });
});
