import '../../domain/entities/message_entity.dart';
import '../models/message_model.dart';

extension MessageMapper on MessageModel {
  MessageEntity toEntity() {
    return MessageEntity(text: text, time: time, isOutgoing: isOutgoing);
  }
}
