// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloomsai/app/common/theme/assets_strings.dart';
import 'package:bloomsai/app/common/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final Function() onTap;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      onTap: onTap,
      leading: SvgPicture.asset(icon),
      title: Text(title, style: AppTextStyles.small12),
    );
  }
}
