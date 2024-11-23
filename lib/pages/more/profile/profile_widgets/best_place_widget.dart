// import 'package:airbnb_app/constants/app_gaps.dart';
// import 'package:airbnb_app/constants/colors.dart';
// import 'package:airbnb_app/constants/text_styles.dart';
// import 'package:airbnb_app/widgets/common/button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class bestPlaceWidget extends StatelessWidget {
//   final String icon;
//   final String title;
//   final bool isSelected;
//   final void Function()? onTap;

//   const bestPlaceWidget(
//       {super.key,
//       required this.title,
//       required this.icon,
//       required this.isSelected,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return RawButtonWidget(
//       onTap: onTap,
//       child: Container(
//         width: 173,
//         height: 105,
//         decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(8.0),
//             border: Border.all(
//                 color: isSelected ? Colors.black : AppColors.dottedColor)),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SvgPicture.asset(icon),
//               AppGaps.hGap4,
//               Text(
//                 title,
//                 style: AppTextStyles.labelTextStyle
//                     .copyWith(color: AppColors.primaryTextColor),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
