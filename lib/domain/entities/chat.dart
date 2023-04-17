import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';

part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  @JsonSerializable(explicitToJson: true)
  const factory Chat({
    required String chatId,
    required ChatMessage chatMessage,
  }) = _Chat;

  factory Chat.fromJson(Map<String, Object?> json) => _$ChatFromJson(json);
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String message,
    required MessageType messageType,
    required String voiceLink,
    required String imageLink,
    required String videoLink,
    required DateTime sentAt,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, Object?> json) =>
      _$ChatMessageFromJson(json);
}

enum MessageType {
  image,
  text,
  voice,
  video,
}
