import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectOption {
  SelectOption({
    required this.label,
    required this.value,
  });

  late final String label;
  late final String value;
}

class Selector extends StatelessWidget {
  final Widget child;
  final List<SelectOption> options;
  final SelectOption selected;
  final String title;
  final void Function(SelectOption) onSelect;

  const Selector({
    super.key,
    required this.child,
    required this.options,
    required this.selected,
    required this.onSelect,
    this.title = 'Select',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => {
        Get.bottomSheet(
          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                        const Spacer(),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: options
                          .map(
                            (option) => GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                onSelect(option);
                                Get.back();
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: option.value == selected.value
                                      ? Colors.black
                                      : const Color(0xFFF8F8F8),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  option.label,
                                  style: TextStyle(
                                    color: option.value == selected.value
                                        ? AppColors.whiteColor
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          enterBottomSheetDuration: const Duration(milliseconds: 150),
          exitBottomSheetDuration: const Duration(milliseconds: 150),
        )
      },
      child: child,
    );
  }
}
