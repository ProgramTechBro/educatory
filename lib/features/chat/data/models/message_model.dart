class MessageModel {
  final String text;
  final String time;
  final bool isOutgoing;

  const MessageModel({
    required this.text,
    required this.time,
    required this.isOutgoing,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      text: json['text'] as String,
      time: json['time'] as String,
      isOutgoing: json['is_outgoing'] as bool,
    );
  }
}
