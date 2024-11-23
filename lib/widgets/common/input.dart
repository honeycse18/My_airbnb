import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';


class FormInput2 extends StatelessWidget {
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

  const FormInput2({
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
            fillColor: const Color(0xFFFAFAFA),
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            suffixIcon: suffix,
            prefix: prefix,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: border3,
            disabledBorder: border3,
            enabledBorder: border3,
            focusedBorder: border3,
            errorBorder: border3,
            focusedErrorBorder: border3,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFFA8A8A8),
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

const border3 = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Color(0xFFDBDBDB), width: 1),
);

const border2 = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Color(0xFFA6A6A6), width: 1),
);

const border = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Color(0xFFDDDDDD), width: 1),
);


class OTPInput extends StatelessWidget {
  final Function(String) onComplete;
  final Function(String)? onChange;
  final OtpFieldController? controller;

  const OTPInput({
    super.key,
    required this.onComplete,
    this.controller,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: OTPTextField(
        controller: controller,
        length: 6,
        width: min(MediaQuery.of(context).size.width * 0.9, 360),
        fieldWidth: 48,
        outlineBorderRadius: 12,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.box,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        otpFieldStyle: OtpFieldStyle(
          backgroundColor: const Color(0xFFF7F7F7),
          borderColor: const Color(0xFFDBDBDB),
          enabledBorderColor: const Color(0xFFDBDBDB),
          focusBorderColor: Colors.black,
        ),
        onChanged: (value) {
          if (onChange != null) {
            onChange!(value);
          }
        },
        onCompleted: onComplete,
      ),
    );
  }
}
