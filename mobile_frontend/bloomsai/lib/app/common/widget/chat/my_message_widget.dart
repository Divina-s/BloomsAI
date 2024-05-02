import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/widget/chat/preview_images_widgets.dart';
import 'package:bloomsai/app/model/chat_model/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MyMessageWidget extends StatelessWidget {
  const MyMessageWidget({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          color: AppColors.userColor,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            if (message.imageUrl.isNotEmpty)
              PreviewImagesWidget(
                message: message,
              ),
            MarkdownBody(
              selectable: true,
              data: message.message.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
