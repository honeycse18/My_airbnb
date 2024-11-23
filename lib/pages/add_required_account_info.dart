import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/widgets/addRequiredInfoWidget.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRequiredAccountInfoController extends GetxController {}

class AddRequiredAccountInfoView extends StatelessWidget {
  const AddRequiredAccountInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AddRequiredAccountInfoController(),
        builder: (AddRequiredAccountInfoController controller) {
          return Scaffold(
            appBar: CoreWidgets.appBarWidget(
              screenContext: context,
              hasBackButton: true,
              titleWidget: Text(
                'Add required account info',
              ),
            ),
            body: CustomScaffoldBodyWidget(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  AppGaps.hGap10,
                  Text(
                    'This information is required for anyone who hosts or helps out with hosting. ',
                    style: AppTextStyles.bodyLargeTextStyle.copyWith(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  AppGaps.hGap30,
                  AccountSection(
                    title: 'Account description',
                    content: 'My account As a private individual',
                    onEdit: () {},
                  ),
                ],
              ),
            )),
          );
        });
  }
}
