class ChatMessageModel {
  String? sender;

  String? text;

  ChatMessageModel({
    this.text,
    this.sender,

  });

  ChatMessageModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    sender = json['sender'];

  }
  ChatMessageModel.fromObjectJson(Map<Object?, Object?> json) {
    text = json['text'] as String?;
    sender = json['sender'] as String?;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['sender'] = this.sender;

    return data;
  }
}
