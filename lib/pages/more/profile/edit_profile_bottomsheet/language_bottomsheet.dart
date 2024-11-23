import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/textfield_widget.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_gaps.dart';

class LanguageBottomsheetController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Korean',
    'Hindi',
    'Arabic',
    'Portuguese',
    'Russian',
    // Add more languages as needed
  ];

  // List to hold selected languages
  var selectedLanguages = <String>[];

  // Method to toggle selection of a language
  void toggleLanguageSelection(String language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
    } else {
      selectedLanguages.add(language);
    }
  }
}

class LanguageBottomsheet extends StatelessWidget {
  LanguageBottomsheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LanguageBottomsheetController(),
      builder: (LanguageBottomsheetController controller) {
        return SizedBox(
          height: context.height * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.primaryColor,
                      )),
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Languages you speak',
                          style: AppTextStyles.semiSmallXBoldTextStyle,
                        ),
                        AppGaps.hGap25,
                        SearchFieldWidget(
                          img: AppAssetImages.searchSVGLogoLine,
                          height: 45,
                          hintext: "Search for a language",
                        ),
                        SizedBox(height: 10),
                        /* Text(
                        '${controller.selectedLanguages.join(', ')}',
                        style: TextStyle(fontSize: 16),
                      ), */
                        SizedBox(
                          height: 600,
                          child: ListView.builder(
                            itemCount: controller.languages.length,
                            itemBuilder: (context, index) {
                              final language = controller.languages[index];
                              return CheckboxListTile(
                                title: Text(language),
                                value: controller.selectedLanguages
                                    .contains(language),
                                onChanged: (bool? value) {
                                  controller.toggleLanguageSelection(language);
                                  controller.update();
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomStretchedButtonWidget(
                    onTap: () {},
                    child: Text(
                      'Save',
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
