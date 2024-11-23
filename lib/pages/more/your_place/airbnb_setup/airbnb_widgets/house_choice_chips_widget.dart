import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HouseChoiceChipsWidgetController extends GetxController {
  final List<Map<String, String>> _choices = [
    {
      'name': 'Charming',
      'image': 'assets/icons/line/charming.svg',
    },
    {
      'name': 'Hip',
      'image': 'assets/icons/line/hip.svg',
    },
    {
      'name': 'Central',
      'image': 'assets/icons/line/central.svg',
    },
    {
      'name': 'Upscale',
      'image': 'assets/icons/line/upscale.svg',
    },
    {
      'name': 'Central',
      'image': 'assets/icons/line/central.svg',
    },
    {
      'name': 'Upscale',
      'image': 'assets/icons/line/upscale.svg',
    },
    {
      'name': 'Hip',
      'image': 'assets/icons/line/hip.svg',
    },
    {
      'name': 'Central',
      'image': 'assets/icons/line/central.svg',
    },
  ];
  final Set<int> _selectedChoices = {};
}

class HouseChoiceChipsWidget extends StatelessWidget {
  const HouseChoiceChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HouseChoiceChipsWidgetController(),
      builder: (HouseChoiceChipsWidgetController controller) {
        return Align(
          alignment: Alignment.topLeft,
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
                        ? AppColors.dottedColor
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
