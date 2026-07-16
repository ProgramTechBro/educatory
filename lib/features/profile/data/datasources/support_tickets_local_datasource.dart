import '../../domain/entities/support_ticket_entity.dart';

class SupportTicketsLocalDataSource {
  List<SupportTicketEntity> getSupportTickets() {
    return [
      SupportTicketEntity(
        id: 'ticket-1',
        ticketNumber: '#9820219',
        subject: 'Robert Fox not complet...',
        previewText:
            "We're sorry to hear you're having trouble log...",
        status: 'Open',
        priority: 'Urgent',
        commentCount: 12,
        timeAgo: '31m ago',
        messages: const [
          SupportTicketMessageEntity(
            body:
                'I cannot log in to my Educatory account. It says '
                '"Invalid username or password." I\'ve tried resetting '
                "my password but still can't access it.",
            timeAgo: '31m ago',
            updatedBy: 'Robert Fox (You)',
          ),
          SupportTicketMessageEntity(
            body:
                "We're sorry to hear you're having trouble logging in. "
                'Please try the following steps:\n\n'
                '1. Clear your browser cache.\n'
                '2. Ensure caps lock is off.\n'
                '3. Try logging in from a different browser or device.\n\n'
                'If the issue persists, please reply to this message.\n'
                'Best regards,\nEducatory Support Team',
            timeAgo: '31m ago',
            updatedBy: 'Alejandro Arno',
          ),
        ],
      ),
      SupportTicketEntity(
        id: 'ticket-2',
        ticketNumber: '#9820219',
        subject: 'I am facing login issue in my acc...',
        previewText:
            "We're sorry to hear you're having trouble log...",
        status: 'Open',
        priority: 'Urgent',
        commentCount: 12,
        timeAgo: '31m ago',
        messages: const [
          SupportTicketMessageEntity(
            body:
                'I am facing a login issue in my account, could you '
                'please help me resolve it as soon as possible?',
            timeAgo: '31m ago',
            updatedBy: 'Robert Fox (You)',
          ),
        ],
      ),
    ];
  }
}
