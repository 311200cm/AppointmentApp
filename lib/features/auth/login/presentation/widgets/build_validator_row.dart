import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';


class BuildValidatorRow extends StatelessWidget {
  final bool hasRowValidator;
  final String text;
  const BuildValidatorRow({
    super.key,
    required this.hasRowValidator,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: hasRowValidator ? Colors.green: AppColors.lightGray ,
          radius: 4,
        ),
        Text(text,
          style: TextStyles.font14BoldBlackRegular.copyWith(
    decoration: hasRowValidator ? TextDecoration.lineThrough : null,
    decorationColor: Colors.green,
    decorationThickness: 2,
    color: hasRowValidator ? AppColors.gray : AppColors.boldBlack,
    ),),
      ],
    );
  }
}
