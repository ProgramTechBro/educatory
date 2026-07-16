class MessageEntity {
  final String text;
  final String time;
  final bool isOutgoing;

  const MessageEntity({
    required this.text,
    required this.time,
    required this.isOutgoing,
  });
}
