import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/home_content_model.dart';
import 'package:airbnb_app/pages/more/profile/profile_bottomsheet/editprofile_address_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/question_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/textfield_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/about_us_bottomsheet_widget.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/born_info_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/profile_bottomsheet/choice_chips_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/language_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/mywork_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/questions_bottomsheet_widget.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/content_image_widgets.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatWithHostBottomsheetWidgetController extends GetxController {}

class ChatWithHostBottomsheetWidget extends StatelessWidget {
  const ChatWithHostBottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChatWithHostBottomsheetWidgetController(),
      builder: (ChatWithHostBottomsheetWidgetController controller) {
        return SizedBox(
          height: context.height * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Scaffold(
                appBar: AppBar(
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(1.0),
                      child: Container(
                        height: 1.0,
                        color: AppColors.dottedColor,
                      )),
                  title: Text(
                    'Host',
                    style: AppTextStyles.bodyLargeSemiboldTextStyle,
                  ),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.primaryColor,
                      )),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: CustomScaffoldBodyWidget(
                      child: Column(
                        children: [
                          AppGaps.hGap24,
                          Center(
                            child: Text(
                              'Today',
                              style: AppTextStyles.bodySmallTextStyle,
                            ),
                          ),
                          AppGaps.hGap56,

                          //Sender Text Design
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppGaps.hGap25,
                                  Image.asset(
                                    'assets/images/user_img1.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ],
                              ),
                              AppGaps.wGap10,
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '12:50 p.m',
                                    style:
                                        AppTextStyles.SmallTextStyle.copyWith(
                                            color:
                                                AppColors.secondaryTextColor),
                                  ),
                                  AppGaps.hGap10,
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(6.0),
                                            topRight: Radius.circular(6.0),
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(6.0)),
                                        border: Border.all(
                                            color: AppColors.dottedColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Sender Text',
                                          style: AppTextStyles.SmallTextStyle),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          AppGaps.hGap30,
                          //Receiver text design

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(6.0),
                                        topRight: Radius.circular(6.0),
                                        bottomLeft: Radius.circular(6.0),
                                        bottomRight: Radius.circular(0.0)),
                                    border: Border.all(
                                        color: AppColors.dottedColor),
                                    color: AppColors.primaryTextColor),
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Hello',
                                      style:
                                          AppTextStyles.SmallTextStyle.copyWith(
                                              color: AppColors.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '12:50 p.m ',
                                    style:
                                        AppTextStyles.SmallTextStyle.copyWith(
                                            color:
                                                AppColors.secondaryTextColor),
                                  ),
                                  AppGaps.hGap8,
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.dottedColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      RawButtonWidget(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppAssetImages.gallerySVGLogoLine,
                          height: 24.0,
                          width: 24.0,
                        ),
                      ),
                      AppGaps.wGap20,
                      Expanded(
                        child: TextfieldWidget(
                          onTap: () {},
                          height: 40,
                          hintext: 'Write a massage',
                          img: AppAssetImages.send,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
