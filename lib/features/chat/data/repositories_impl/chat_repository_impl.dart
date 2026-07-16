import '../../domain/entities/contact_entity.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/parameters/send_message_params.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/local/chat_local_datasource.dart';
import '../datasources/remote/chat_remote_datasource.dart';
import '../mappers/message_mapper.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatLocalDataSource localDataSource;
  final ChatRemoteDataSource remoteDataSource;

  const ChatRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<ContactEntity>> getContacts() async {
    return localDataSource.getContacts();
  }

  @override
  Future<List<MessageEntity>> getMessages(String contactId) async {
    return localDataSource.getMessages(contactId);
  }

  @override
  Future<MessageEntity> sendMessage(SendMessageParams params) async {
    final model = await remoteDataSource.sendMessage(
      params.contactId,
      params.text,
    );
    return model.toEntity();
  }
}
