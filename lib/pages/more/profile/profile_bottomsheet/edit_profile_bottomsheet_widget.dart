import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/home_content_model.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_bottomsheet/choice_chips_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/profile_bottomsheet/editprofile_address_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/question_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/about_us_bottomsheet_widget.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/born_info_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/language_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/mywork_bottomsheet.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/questions_bottomsheet_widget.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/content_image_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditProfileBottomSheetWidgetController extends GetxController {
  RxBool isActiveSelected = true.obs;
  RxBool isSelected = false.obs;
  RxBool value = false.obs;
  RxBool theme = false.obs;

  final _controller = ValueNotifier(false);
  HomeContent yourdestination = FakeData.destination.first;

  TextEditingController messageController = TextEditingController();

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}

class EditProfileBottomSheetWidget extends StatelessWidget {
  const EditProfileBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditProfileBottomSheetWidgetController(),
      builder: (EditProfileBottomSheetWidgetController controller) {
        return SizedBox(
          height: context.height * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Edit Profile',
                      style: AppTextStyles.bodyLargeSemiboldTextStyle,
                    ),
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
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: AppColors.dottedColor,
                          ),
                          AppGaps.hGap20,
                          //Profile image
                          Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                Image.asset(
                                  AppAssetImages.userImage,
                                  height: 100,
                                  width: 100,
                                ),
                                Positioned(
                                    bottom: -10,
                                    child: Container(
                                      height: 30,
                                      width: 67,
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, right: 5.0),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AppAssetImages
                                                      .cameraSVGLogoSolid,
                                                  height: 12.25,
                                                  width: 14,
                                                ),
                                                AppGaps.wGap5,
                                                Text(
                                                  'Add',
                                                  style: AppTextStyles
                                                      .bodyTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          AppGaps.hGap27,

                          Text(
                            'Your Profile',
                            style: AppTextStyles.notificationDateSection
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                          AppGaps.hGap15,
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      'The information you share will be used across Airbnb to help other guess and hosts get to know you. ',
                                  style: AppTextStyles.bodyTextStyle.copyWith(
                                      color: AppColors.secondaryTextColor)),
                              TextSpan(
                                  text: 'Learn more',
                                  style: AppTextStyles.bodyLargeBoldTextStyle
                                      .copyWith(
                                          color: AppColors.primaryTextColor))
                            ]),
                          ),
                          AppGaps.hGap28,
                          Column(
                            children: [
                              QuestionWidget(
                                img: AppAssetImages.eduLogo,
                                title: 'Where I went to school',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      QuestionsBottomSheetWidget(
                                          hintText: 'Write here',
                                          title: 'Where did you go to school?',
                                          subtitle:
                                              'Whether it’s home school, high school, or trade school, name the school that made you who you are.'));
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                img: AppAssetImages.workLogo,
                                title: 'My work',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      MyworkBottomsheet(
                                        title: 'What do you do for work?',
                                        subtitle: RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style
                                                .copyWith(fontSize: 16),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    "Tell us what your profession is. If you don't have a traditional job, tell us your life's calling. Example: nurse, parent to four kids, or retired surfer. ",
                                                style: AppTextStyles
                                                    .labelTextStyle
                                                    .copyWith(
                                                  color: AppColors
                                                      .secondaryTextColor,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "Where is this shown?",
                                                style: AppTextStyles
                                                    .bodyLargeBoldTextStyle
                                                    .copyWith(
                                                  color: AppColors
                                                      .secondaryTextColor,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        hintText: 'My work:',
                                      ));
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                  img: AppAssetImages.globLogo,
                                  title: 'Where i live',
                                  onTap: () {
                                    Get.bottomSheet(
                                        isScrollControlled: true,
                                        EditProfileAddressBottomSheet());
                                  }),
                              Divider(),
                              QuestionWidget(
                                img: AppAssetImages.languageLogo,
                                title: 'Languages I speak',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      LanguageBottomsheet());
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                img: AppAssetImages.bornPlaceLogo,
                                title: 'Decade I was born',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      BornInfoBottomsheet());
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                img: AppAssetImages.musicLogo,
                                title: 'My favorite song in high school',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      QuestionsBottomSheetWidget(
                                          hintText: 'Write here',
                                          title:
                                              'What was your favorite song in high school?',
                                          subtitle:
                                              'However embarrassing, share the tune you listened to on repeat as a teenager'));
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                img: AppAssetImages.favouriteLogo,
                                title: 'I’b obsessed  with',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      QuestionsBottomSheetWidget(
                                          hintText: 'Write here',
                                          title: 'What are you obsessed with?',
                                          subtitle:
                                              'Share whatever you can\'t get enough of-in a good way.Example: Baking rosemerrory faafocaccia'));
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                img: AppAssetImages.funLogo,
                                title: 'My fun fact',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      QuestionsBottomSheetWidget(
                                        title: 'What\'s a fun fact about you?',
                                        subtitle:
                                            'Share something unique or unexpected about you. Example: I was in a music video or I\'m a juggler',
                                        hintText: 'Write here',
                                      ));
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                img: AppAssetImages.skillLogo,
                                title: 'My most useless skill',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      QuestionsBottomSheetWidget(
                                          hintText: 'Write here',
                                          title:
                                              'What\'s your most useless skill?',
                                          subtitle:
                                              'Share a surpricing but pointless talent you have. Example: Suffling cards with one hand.'));
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                img: AppAssetImages.bioLogo,
                                title: 'My biography title would be',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      QuestionsBottomSheetWidget(
                                          hintText:
                                              'My biography title would be:',
                                          title:
                                              'What would your biography title be?',
                                          subtitle:
                                              'If someone wrote a book about your life, what would they call it? Example: Born to Roam or Chronicles of a Dog Mom.'));
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                img: AppAssetImages.timeLogo,
                                title: 'I spend too much time',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      QuestionsBottomSheetWidget(
                                          hintText: 'I spend too much time:',
                                          title:
                                              'What do you spend too much time doing?',
                                          subtitle:
                                              'Share an activity or hobby you spend lots of free time on. Example: Watching cat videos or playing chess.'));
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              QuestionWidget(
                                img: AppAssetImages.petLogo,
                                title: 'Pets',
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      QuestionsBottomSheetWidget(
                                          hintText: 'Pets:',
                                          title:
                                              'Do you have any pets in your life?',
                                          subtitle:
                                              'Share any pets you have and their names. Example: My calico cat Whiskers, or Leonardo my speedy turtle.'));
                                },
                              ),
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                            ],
                          ),
                          AppGaps.hGap28,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Us',
                                style: AppTextStyles
                                    .titleSemiSmallSemiboldTextStyle
                                    .copyWith(
                                        color: AppColors.primaryTextColor),
                              ),
                              AppGaps.hGap16,
                              Row(
                                children: [
                                  Expanded(
                                    child: DottedBorder(
                                      color: AppColors.dottedColor,
                                      borderType: BorderType.RRect,
                                      strokeWidth: 1,
                                      dashPattern: [4, 4],
                                      radius: Radius.circular(6.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        child: Container(
                                            height: 77,
                                            decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: RawButtonWidget(
                                              onTap: () {
                                                Get.bottomSheet(
                                                    isScrollControlled: true,
                                                    AboutUsBottomSheetWidget());
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, top: 10.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Write something fun and punchy',
                                                      style: AppTextStyles
                                                          .bodySmallMediumTextStyle
                                                          .copyWith(
                                                              color: AppColors
                                                                  .secondaryTextColor),
                                                    ),
                                                    Text(
                                                      'Add intro',
                                                      style: AppTextStyles
                                                          .bodySmallMediumTextStyle
                                                          .copyWith(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              color: AppColors
                                                                  .primaryTextColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AppGaps.hGap24,
                              Text(
                                'What you’re into',
                                style: AppTextStyles
                                    .titlesemiSmallMediumTextStyle
                                    .copyWith(
                                        color: AppColors.primaryTextColor),
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: TitleSubtitleWidget(
                                      subtitle:
                                          'Find common ground with other guests and Hosts by adding interests to your profile',
                                    ),
                                  ),
                                ],
                              ),
                              AppGaps.hGap10,
                              Row(
                                children: [
                                  RawButtonWidget(
                                    onTap: () {
                                      Get.bottomSheet(
                                          isScrollControlled: true,
                                          ChoiceChipsBottomSheetWidget());
                                    },
                                    child: DottedBorder(
                                      color: AppColors.dottedColor,
                                      borderType: BorderType.RRect,
                                      strokeWidth: 1,
                                      dashPattern: [4, 4],
                                      radius: Radius.circular(40.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        child: Container(
                                          height: 36,
                                          width: 106,
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            color: AppColors.secondaryTextColor,
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppGaps.wGap16,
                                  RawButtonWidget(
                                    onTap: () {
                                      Get.bottomSheet(
                                          isScrollControlled: true,
                                          ChoiceChipsBottomSheetWidget());
                                    },
                                    child: DottedBorder(
                                      color: AppColors.dottedColor,
                                      borderType: BorderType.RRect,
                                      strokeWidth: 1,
                                      dashPattern: [4, 4],
                                      radius: Radius.circular(40.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        child: Container(
                                          height: 36,
                                          width: 106,
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            color: AppColors.secondaryTextColor,
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppGaps.wGap16,
                                  RawButtonWidget(
                                    onTap: () {
                                      Get.bottomSheet(
                                          isScrollControlled: true,
                                          ChoiceChipsBottomSheetWidget());
                                    },
                                    child: DottedBorder(
                                      color: AppColors.dottedColor,
                                      borderType: BorderType.RRect,
                                      strokeWidth: 1,
                                      dashPattern: [4, 4],
                                      radius: Radius.circular(40.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        child: Container(
                                          height: 36,
                                          width: 106,
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            color: AppColors.secondaryTextColor,
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AppGaps.hGap17,
                              Text(
                                'Add interests and sports',
                                style: AppTextStyles.bodyTextStyle.copyWith(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primaryTextColor),
                              ),
                              AppGaps.hGap28,
                              Divider(
                                color: AppColors.dottedColor,
                              ),
                              AppGaps.hGap28,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Where you’ve been',
                                    style: AppTextStyles
                                        .titlesemiSmallMediumTextStyle
                                        .copyWith(
                                            color: AppColors.primaryTextColor),
                                  ),
                                  AdvancedSwitch(
                                    controller: controller._controller,
                                    enabled: true,
                                    activeColor: AppColors.primaryColor,
                                    height: 30.0,
                                    width: 45.0,
                                    onChanged: (value) {
                                      controller._controller.addListener(() {
                                        if (controller._controller.value) {
                                          controller.theme = true.obs;
                                        } else {
                                          controller.theme = false.obs;
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                              AppGaps.hGap10,
                              Text(
                                'Choose whether other people can see all the places you\'ve been on Airbnb',
                                style: AppTextStyles.bodyLargeTextStyle
                                    .copyWith(
                                        color: AppColors.secondaryTextColor),
                              ),
                              AppGaps.hGap16,
                              // SizedBox(
                              //   height: 120,
                              //   child: ListView.separated(
                              //       scrollDirection: Axis.horizontal,
                              //       itemBuilder: (context, index) {
                              //         controller.yourdestination =
                              //             FakeData.destination[index];
                              //         return DestinationImageContentWidget(
                              //             localImageLocation: controller
                              //                 .yourdestination
                              //                 .localSVGImageLocation,
                              //             subtitle: controller
                              //                 .yourdestination
                              //                 .content);
                              //       },
                              //       separatorBuilder:
                              //           (context, index) =>
                              //               AppGaps.wGap25,
                              //       itemCount:
                              //           FakeData.destination.length),
                              // ),
                              Row(
                                children: [
                                  DestinationImageContentWidget(
                                      localImageLocation:
                                          'assets/images/world.png',
                                      subtitle: 'Next destination',
                                      radius: 6.0),
                                  AppGaps.wGap10,
                                  DestinationImageContentWidget(
                                      localImageLocation:
                                          'assets/images/sun.png',
                                      subtitle: 'Next destination',
                                      radius: 40.0),
                                ],
                              ),

                              AppGaps.hGap30,
                              Divider(
                                color: AppColors.dottedColor,
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
                  child: CustomStretchedButtonWidget(
                    onTap: () {},
                    child: Text(
                      'Done',
                      style: AppTextStyles.semiMediumBoldTextStyle,
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
