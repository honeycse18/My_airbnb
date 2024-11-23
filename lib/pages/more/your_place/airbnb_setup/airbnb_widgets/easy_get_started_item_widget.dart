import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:flutter/material.dart';

class EasyGetStartedItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;
  final void Function()? onTap;

  const EasyGetStartedItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.img,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: TitleSubtitleWidget(
          title: title,
          subtitle: subtitle,
        ),
      ),
      Image.asset(
        img,
        width: 87,
        height: 87,
      ),
    ]);
  }
}
