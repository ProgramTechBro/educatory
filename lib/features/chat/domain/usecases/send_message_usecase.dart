import '../entities/message_entity.dart';
import '../parameters/send_message_params.dart';
import '../repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  const SendMessageUseCase(this.repository);

  Future<MessageEntity> call(SendMessageParams params) {
    return repository.sendMessage(params);
  }
}
