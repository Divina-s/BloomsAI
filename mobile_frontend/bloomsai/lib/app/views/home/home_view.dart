import 'package:bloomsai/app/common/theme/app_colors.dart';
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:bloomsai/app/common/widget/others/crop_card.dart';
import 'package:bloomsai/app/common/widget/others/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
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
    return SafeArea(
      top: false,
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
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
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.sp),
                        bottomRight: Radius.circular(30.sp))),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: -4),
                      title: Text('Hello John,',
                          style: AppTextStyles.body14
                              .copyWith(color: AppColors.whiteColor)),
                      subtitle: Text('Scan the health of your crop today,',
                          style: AppTextStyles.small12
                              .copyWith(color: AppColors.whiteColor)),
                      trailing: Image.asset(
                        ImageAssets.profile,
                        width: 40.0,
                        height: 40.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                children: [
                  SizedBox(height: 50.h),
                  Text('Crop Category', style: AppTextStyles.small12),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CropCard(
                        title: "Tomatoes",
                        image: ImageAssets.tomato,
                      ),
                      CropCard(
                        title: "Maize",
                        image: ImageAssets.maize,
                      ),
                      CropCard(
                        title: "Potatoes",
                        image: ImageAssets.potatoes,
                      ),
                      CropCard(
                        title: "Cassava",
                        image: ImageAssets.casava,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CropCard(
                        title: "Beans",
                        image: ImageAssets.beans,
                      ),
                      CropCard(
                        title: "Groundnut",
                        image: ImageAssets.groundnut,
                      ),
                      CropCard(
                        title: "Cocoa Yams",
                        image: ImageAssets.yams,
                      ),
                      CropCard(
                        title: "HuckleBerry",
                        image: ImageAssets.jama,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text('Past History', style: AppTextStyles.small12),
                  SizedBox(height: 1.h),
                  PostCard(
                    image: ImageAssets.casava,
                    title: 'Botrytis (Gray Mold)',
                  )
                ],
              ),
              Positioned(
                top: 30.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: RepaintBoundary(
                    child: Container(
                      width: 90.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15.sp),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 18,
                              offset: Offset(-3, 3),
                            )
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageAssets.select,
                                  height: 6.h,
                                  width: 6.h,
                                ),
                                Text(
                                  "Select Crop",
                                  style: AppTextStyles.small8Bold
                                      .copyWith(height: 1.5.sp),
                                )
                              ],
                            ),
                            SvgPicture.asset(
                              ImageAssets.arrow,
                              width: 5.h,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageAssets.upload,
                                  height: 6.h,
                                  width: 6.h,
                                ),
                                Text(
                                  "Upload Image",
                                  style: AppTextStyles.small8Bold
                                      .copyWith(height: 1.5.sp),
                                )
                              ],
                            ),
                            SvgPicture.asset(
                              ImageAssets.arrow,
                              width: 5.h,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageAssets.solution,
                                  height: 6.h,
                                  width: 6.h,
                                ),
                                Text(
                                  "Get Solution",
                                  style: AppTextStyles.small8Bold
                                      .copyWith(height: 1.5.sp),
                                )
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
