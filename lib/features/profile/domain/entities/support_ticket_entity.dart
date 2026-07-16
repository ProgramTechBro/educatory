class SupportTicketMessageEntity {
  final String body;
  final String timeAgo;
  final String updatedBy;

  const SupportTicketMessageEntity({
    required this.body,
    required this.timeAgo,
    required this.updatedBy,
  });
}

class SupportTicketEntity {
  final String id;
  final String ticketNumber;
  final String subject;
  final String previewText;
  final String status;
  final String priority;
  final int commentCount;
  final String timeAgo;
  final List<SupportTicketMessageEntity> messages;

  const SupportTicketEntity({
    required this.id,
    required this.ticketNumber,
    required this.subject,
    required this.previewText,
    required this.status,
    required this.priority,
    required this.commentCount,
    required this.timeAgo,
    required this.messages,
  });
}
