import 'package:bloomsai/app/controller/provider/bottom_navbar/bottom_navbar.dart';
import 'package:bloomsai/app/views/community/community_view.dart';
import 'package:bloomsai/app/views/diagnose/diagnose_view.dart';
import 'package:bloomsai/app/views/home/home_view.dart';
import 'package:bloomsai/app/views/profile/account_view.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../common/theme/app_colors.dart';
import '../../common/theme/text_style.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List<Widget> screens = [
    const HomeView(),
    const DiagnoseView(),
    const CommunityView(),
    const AccountView()
  ];

  List<PersistentBottomNavBarItem> _navBarItems(int currentTab) {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
            size: 24.sp,
            currentTab == 0 ? IconlyLight.home : IconlyLight.home,
          ),
          title: 'Home',
          textStyle: AppTextStyles.small8,
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(
            size: 24.sp,
            currentTab == 0 ? IconlyLight.camera : IconlyLight.camera,
          ),
          title: 'Diagnose',
          textStyle: AppTextStyles.small8,
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(
            currentTab == 0 ? Icons.group_outlined : Icons.group_outlined,
            size: 24.sp,
          ),
          title: 'Community',
          textStyle: AppTextStyles.small8,
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(
            size: 24.sp,
            currentTab == 0 ? IconlyLight.profile : IconlyLight.profile,
          ),
          title: 'Profile',
          textStyle: AppTextStyles.small8,
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.grey),
    ];
  }

  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
        builder: (context, tabProvider, child) {
      return PersistentTabView(
        context,
        navBarHeight: 8.h,
        controller: tabController,
        screens: screens,
        items: _navBarItems(tabProvider.currentTab),
        confineInSafeArea: true,
        onItemSelected: (value) {},
        backgroundColor: AppColors.whiteColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          colorBehindNavBar: AppColors.whiteColor,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200), curve: Curves.easeInCirc),
        screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 200)),
        navBarStyle: NavBarStyle.style6,
      );
    });
  }
}
