import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/widget/chat/chat_history_widget.dart';
import 'package:bloomsai/app/common/widget/chat/empty_history_widget.dart';
import 'package:bloomsai/app/controller/provider/hive/boxes.dart';
import 'package:bloomsai/app/controller/provider/hive/chat_history.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChatHistoryView extends StatefulWidget {
  const ChatHistoryView({Key? key}) : super(key: key);

  @override
  _ChatHistoryViewState createState() => _ChatHistoryViewState();
}

class _ChatHistoryViewState extends State<ChatHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 0.0,
          title: Text('Chat History!', style: AppTextStyles.body16),
        ),
        body: ValueListenableBuilder<Box<ChatHistory>>(
          valueListenable: Boxes.getChatHistory().listenable(),
          builder: (context, box, _) {
            final chatHistory =
                box.values.toList().cast<ChatHistory>().reversed.toList();
            return chatHistory.isEmpty
                ? const EmptyHistoryWidget()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: chatHistory.length,
                      itemBuilder: (context, index) {
                        final chat = chatHistory[index];
                        return ChatHistoryWidget(chat: chat);
                      },
                    ),
                  );
          },
        ));
  }
}
