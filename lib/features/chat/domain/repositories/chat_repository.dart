import '../entities/contact_entity.dart';
import '../entities/message_entity.dart';
import '../parameters/send_message_params.dart';

abstract class ChatRepository {
  Future<List<ContactEntity>> getContacts();
  Future<List<MessageEntity>> getMessages(String contactId);
  Future<MessageEntity> sendMessage(SendMessageParams params);
}
