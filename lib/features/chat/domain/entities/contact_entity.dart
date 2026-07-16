class ContactEntity {
  final String id;
  final String avatar;
  final String name;
  final String subjectTag;
  final String lastMessage;
  final String timeAgo;
  final bool isOnline;

  const ContactEntity({
    required this.id,
    required this.avatar,
    required this.name,
    required this.subjectTag,
    required this.lastMessage,
    required this.timeAgo,
    required this.isOnline,
  });
}
