// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      chatId: json['chatId'] as String,
      chatMessage:
          ChatMessage.fromJson(json['chatMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'chatId': instance.chatId,
      'chatMessage': instance.chatMessage,
    };

_$_ChatMessage _$$_ChatMessageFromJson(Map<String, dynamic> json) =>
    _$_ChatMessage(
      message: json['message'] as String,
      messageType: $enumDecode(_$MessageTypeEnumMap, json['messageType']),
      voiceLink: json['voiceLink'] as String,
      imageLink: json['imageLink'] as String,
      videoLink: json['videoLink'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
    );

Map<String, dynamic> _$$_ChatMessageToJson(_$_ChatMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
      'voiceLink': instance.voiceLink,
      'imageLink': instance.imageLink,
      'videoLink': instance.videoLink,
      'sentAt': instance.sentAt.toIso8601String(),
    };

const _$MessageTypeEnumMap = {
  MessageType.image: 'image',
  MessageType.text: 'text',
  MessageType.voice: 'voice',
  MessageType.video: 'video',
};
