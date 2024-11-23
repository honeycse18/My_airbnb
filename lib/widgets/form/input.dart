import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../common/input.dart';

class FormInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final ValueSetter? onChanged;
  final String? initialValue;
  final bool? obscureText, readOnly;
  final int? maxLines;
  final int? lines;
  final TextInputType? type;
  final double? marginBottom;

  const FormInput({
    super.key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.prefix,
    this.validator,
    this.onChanged,
    this.obscureText,
    this.initialValue,
    this.type,
    this.maxLines,
    this.readOnly,
    this.suffix,
    this.lines,
    this.marginBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF383838),
                ),
              )
            : const SizedBox(),
        label != null
            ? const SizedBox(
                height: 12,
              )
            : const SizedBox(),
        TextFormField(
          obscureText: obscureText ?? false,
          keyboardType: type ?? TextInputType.name,
          minLines: lines ?? 1,
          maxLines: maxLines,
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.whiteColor,
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            suffixIcon: suffix,
            prefix: prefix,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: border2,
            disabledBorder: border2,
            enabledBorder: border2,
            focusedBorder: border2,
            errorBorder: border2,
            focusedErrorBorder: border2,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFF383838),
            ),
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 13,
            ),
          ),
          onChanged: onChanged,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(fontSize: 14),
        ),
        SizedBox(
          height: marginBottom ?? 16,
        ),
      ],
    );
  }
}
