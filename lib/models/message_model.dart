class MessageModel {
  MessageModel({
    required this.content,
    required this.time,
    required this.author,
  });

  String content;
  DateTime time;
  String author;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        content: json["content"],
        time: DateTime.parse(json["time"]),
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "method": "msg",
        "content": content,
        "time": time.toString(),
        "author": author,
      };
}
