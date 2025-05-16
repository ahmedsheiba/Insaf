import 'package:flutter/material.dart';
import 'package:insaf/core/utils/app_colors.dart';

class CustomSwitcher extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitcher({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      inactiveTrackColor: Colors.white,
      activeTrackColor: AppColors.primary,
      padding: EdgeInsets.zero,
      value: value,
      onChanged: onChanged,
    );
  }
}
