import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../common/utils/navigator.dart';
import '../chat/chat_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0.sp,
        splashColor: AppColors.whiteColor,
        backgroundColor: AppColors.whiteColor,
        tooltip: '',
        onPressed: () {
          PageNavigator(ctx: context).nextPage(page: const ChatView());
        },
        child: SvgPicture.asset(ImageAssets.bot),
      ),
      body: ListView(
        children: [SvgPicture.asset(ImageAssets.arrow)],
      ),
    );
  }
}
