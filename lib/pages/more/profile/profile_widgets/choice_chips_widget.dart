import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ChoiceChipsWidgetController extends GetxController {
  final List<Map<String, String>> _choices = [
    {
      'name': 'Architecture',
      'image': 'assets/icons/line/sports.svg',
    },
    {
      'name': 'Food',
      'image': 'assets/icons/line/camping.svg',
    },
    {
      'name': 'History',
      'image': 'assets/icons/line/history.svg',
    },
    {
      'name': 'Live Music',
      'image': 'assets/icons/line/camping.svg',
    },
    {
      'name': 'Live Sports',
      'image': 'assets/icons/line/bridge.svg',
    },
    {
      'name': 'Museums',
      'image': 'assets/icons/line/history.svg',
    },
    {
      'name': 'Outdoors',
      'image': 'assets/icons/line/bridge.svg',
    },
    {
      'name': 'Photography',
      'image': 'assets/icons/line/photography.svg',
    },
    {
      'name': 'Reading',
      'image': 'assets/icons/line/Reading.svg',
    },
    {
      'name': 'Shopping',
      'image': 'assets/icons/line/Shopping.svg',
    },
    {
      'name': 'Theater',
      'image': 'assets/icons/line/Shopping.svg',
    },
    {
      'name': 'Water sports',
      'image': 'assets/icons/line/Shopping.svg',
    },
    {
      'name': 'Wine',
      'image': 'assets/icons/line/Shopping.svg',
    },
    {
      'name': 'Yoga',
      'image': 'assets/icons/line/yoga.svg',
    },
  ];
  final Set<int> _selectedChoices = {};
}

class ChoiceChipsWidget extends StatelessWidget {
  const ChoiceChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChoiceChipsWidgetController(),
      builder: (ChoiceChipsWidgetController controller) {
        return Center(
          child: Wrap(
            spacing: 10.0,
            children: controller._choices.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> choice = entry.value;
              return ChoiceChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      choice['image']!,
                      width: 20,
                      height: 20,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 8.0),
                    Text(choice['name']!),
                  ],
                ),
                selected: controller._selectedChoices.contains(index),
                onSelected: (bool selected) {
                  if (selected) {
                    controller._selectedChoices.add(index);
                    controller.update();
                  } else {
                    controller._selectedChoices.remove(index);
                    controller.update();
                  }
                },
                selectedColor: AppColors.whiteColor,
                backgroundColor: AppColors.whiteColor,
                labelStyle: TextStyle(
                  color: controller._selectedChoices.contains(index)
                      ? AppColors.primaryColor
                      : AppColors.primaryTextColor,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: controller._selectedChoices.contains(index)
                        ? AppColors.primaryColor
                        : AppColors.inputFieldBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
