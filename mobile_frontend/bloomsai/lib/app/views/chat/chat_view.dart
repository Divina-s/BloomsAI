import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/utils/navigator.dart';
import 'package:bloomsai/app/common/utils/show_dialogue.dart';
import 'package:bloomsai/app/common/widget/chat/bottom_chat_field.dart';
import 'package:bloomsai/app/common/widget/chat/chat_messages.dart';
import 'package:bloomsai/app/controller/provider/chat/chat_provider.dart';
import 'package:bloomsai/app/views/chat/chat_history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  // scroll controller
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent > 0.0) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        if (chatProvider.inChatMessages.isNotEmpty) {
          _scrollToBottom();
        }

        // auto scroll to bottom on new message
        chatProvider.addListener(() {
          if (chatProvider.inChatMessages.isNotEmpty) {
            _scrollToBottom();
          }
        });
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0.0,
            title: Text('BloomsAi ChatBot!', style: AppTextStyles.body16),
            actions: [
              InkWell(
                onTap: () async {
                  showMyAnimatedDialog(
                    context: context,
                    title: 'Start New Chat',
                    content: 'Are you sure you want to start a new chat?',
                    actionText: 'Yes',
                    onActionPressed: (value) async {
                      if (value) {
                        // prepare chat room
                        await chatProvider.prepareChatRoom(
                            isNewChat: true, chatID: '');
                      }
                    },
                  );
                },
                child: const Icon(
                  Icons.add,
                  size: 26.0,
                ),
              ),
              const SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  PageNavigator(ctx: context)
                      .nextPage(page: const ChatHistoryView());
                },
                child: const Icon(
                  Icons.history,
                  size: 26.0,
                ),
              ),
              const SizedBox(width: 20.0)
            ],
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: chatProvider.inChatMessages.isEmpty
                      ? const Center(
                          child: Text("How can I Help You!"),
                        )
                      : ChatMessages(
                          scrollController: _scrollController,
                          chatProvider: chatProvider,
                        ),
                ),
                BottomChatField(
                  chatProvider: chatProvider,
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
