import 'package:bloomsai/app/common/widget/chat/assistant_message_widget.dart';
import 'package:bloomsai/app/common/widget/chat/my_message_widget.dart';
import 'package:bloomsai/app/controller/provider/chat/chat_provider.dart';
import 'package:bloomsai/app/model/chat_model/message.dart';
import 'package:flutter/material.dart';


class ChatMessages extends StatelessWidget {
  const ChatMessages({
    Key? key,
    required this.scrollController,
    required this.chatProvider,
  }) : super(key: key);

  final ScrollController scrollController;
  final ChatProvider chatProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: chatProvider.inChatMessages.length,
      itemBuilder: (context, index) {
        // compare with timeSent bewfore showing the list
        final message = chatProvider.inChatMessages[index];
        return message.role == Role.user
            ? MyMessageWidget(message: message)
            : AssistantMessageWidget(
                message: message.message.toString(),
              );
      },
    );
  }
}
