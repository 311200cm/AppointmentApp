import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../login/presentation/widgets/build_validator_row.dart';

class PasswordAndConfirmPasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  const PasswordAndConfirmPasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column (
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BuildValidatorRow(hasRowValidator: hasUpperCase, text: "At least 1 uppercase letter"),
      SizedBox(height: 10.h,),
      BuildValidatorRow(hasRowValidator: hasLowerCase, text: "At least 1 lowercase letter"),
      SizedBox(height: 10.h,),
      BuildValidatorRow(hasRowValidator: hasNumber, text: "At least 1 number letter"),
      SizedBox(height: 10.h,),
      BuildValidatorRow(hasRowValidator: hasSpecialCharacter, text: "At least 1 special character letter"),
      SizedBox(height: 10.h,),
      BuildValidatorRow(hasRowValidator: hasMinLength, text: "At least 8 letter"),
      SizedBox(height: 10.h,),
    ],
    );
  }
}
