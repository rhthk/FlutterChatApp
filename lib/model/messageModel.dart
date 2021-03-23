class Message {
  String message,time;
  int messageType;
  int id;
  Message(this.id,this.message,this.time,this.messageType);
  
  factory Message.fromJSON(Map<String,dynamic> json){
    return Message(json['msgID'], json['data'], json['time'],json['messageType']);
  }
}