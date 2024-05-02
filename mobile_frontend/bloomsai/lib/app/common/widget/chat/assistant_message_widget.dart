import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class AssistantMessageWidget extends StatelessWidget {
  const AssistantMessageWidget({Key? key, required this.message})
      : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
        decoration: BoxDecoration(
          color: AppColors.botColor,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(bottom: 8.0),
        child: message.isEmpty
            ?  SizedBox(
                width: 50,
                height: 20.0,
                child: SpinKitThreeBounce(
                  color: AppColors.primaryColor,
                  size: 20.0,
                ),
              )
            : MarkdownBody(selectable: true, data: message),
      ),
    );
  }
}
