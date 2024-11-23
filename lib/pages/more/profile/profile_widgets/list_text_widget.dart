import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class ListTextWidget extends StatelessWidget {
  ListTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BulletPointList(
      items: [
        'We’ll use this to verify your account',
        'These details are required by law',
        'Inaccurate or missing information can delay payouts or limit your account access',
      ],
    );
  }
}

class BulletPointList extends StatelessWidget {
  final List<String> items;

  BulletPointList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("•  "),
                Expanded(
                  child: Text(item),
                ),
              ],
            ),
            AppGaps.hGap5,
          ],
        );
      }).toList(),
    );
  }
}
