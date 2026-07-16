import '../../../../config/app_assets.dart';
import '../../domain/entities/contact_entity.dart';
import '../../domain/entities/message_entity.dart';

class ChatLocalDataSource {
  List<ContactEntity> getContacts() {
    return const [
      ContactEntity(
        id: 'robert-fox',
        avatar: AppNetworkImages.tutorRobertFox,
        name: 'Robert Fox',
        subjectTag: 'ARCH116',
        lastMessage: 'Hello, I need help with the recent assignment',
        timeAgo: '3h ago',
        isOnline: true,
      ),
      ContactEntity(
        id: 'jane-cooper',
        avatar: AppNetworkImages.contactJaneCooper,
        name: 'Jane Cooper',
        subjectTag: 'MAT116',
        lastMessage: 'Hello, I need to fix that as...',
        timeAgo: '19h ago',
        isOnline: false,
      ),
      ContactEntity(
        id: 'esther-howard',
        avatar: AppNetworkImages.tutorEstherHoward,
        name: 'Esther Howard',
        subjectTag: 'MAT116',
        lastMessage: "Hello, I'm struggling with a concept from last class",
        timeAgo: '1d ago',
        isOnline: true,
      ),
      ContactEntity(
        id: 'jacob-jones',
        avatar: AppNetworkImages.contactJacobJones,
        name: 'Jacob Jones',
        subjectTag: 'ARCH116',
        lastMessage: 'Hi, I have some questions about the homework',
        timeAgo: '2d ago',
        isOnline: false,
      ),
      ContactEntity(
        id: 'cody-fisher',
        avatar: AppNetworkImages.contactCodyFisher,
        name: 'Cody Fisher',
        subjectTag: 'CHEM116',
        lastMessage: 'Hello, I need to fix that as...',
        timeAgo: '5d ago',
        isOnline: false,
      ),
      ContactEntity(
        id: 'albert-flores',
        avatar: AppNetworkImages.contactAlbertFlores,
        name: 'Albert Flores',
        subjectTag: 'CHEM116',
        lastMessage:
            "Hi, could you assist me with a problem I'm facing in the "
            'course?',
        timeAgo: '1w ago',
        isOnline: true,
      ),
      ContactEntity(
        id: 'ralph-edwards',
        avatar: AppNetworkImages.contactRalphEdwards,
        name: 'Ralph Edwards',
        subjectTag: 'MAT116',
        lastMessage: 'Hi, I need clarification on the lecture notes',
        timeAgo: '1m ago',
        isOnline: true,
      ),
    ];
  }

  List<MessageEntity> getMessages(String contactId) {
    return const [
      MessageEntity(
        text: 'Sure, Shahin. Which part are you finding difficult?',
        time: 'Saturday, 08:00 am',
        isOutgoing: false,
      ),
      MessageEntity(
        text:
            "I'm confused about the second question. It's asking for a "
            "root cause analysis, but I'm not sure how to start.",
        time: 'Saturday, 08:05 am',
        isOutgoing: true,
      ),
      MessageEntity(
        text:
            "Okay, let's break it down. First, identify the main "
            'problem, then list potential causes. After that, we will '
            'analyze and find the root cause.',
        time: 'Saturday, 08:10 am',
        isOutgoing: false,
      ),
      MessageEntity(
        text:
            "Got it, thanks! That makes more sense. I'll give it a try "
            'and let you know if I have more questions.',
        time: 'Saturday, 08:15 am',
        isOutgoing: true,
      ),
    ];
  }
}
