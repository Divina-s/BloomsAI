import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/views/onboard/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Center(
        child: SvgPicture.asset(
          ImageAssets.logo_white,
        ),
      ),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(() => const OnboardView(),
          duration: const Duration(milliseconds: 800),
          transition: Transition.zoom);
    });
  }
}
