import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

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