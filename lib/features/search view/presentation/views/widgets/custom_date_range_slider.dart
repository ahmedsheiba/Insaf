import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class CustomDateRangeSlider extends StatefulWidget {
  const CustomDateRangeSlider({super.key});

  @override
  State<CustomDateRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomDateRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(0, 14);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            valueIndicatorColor: AppColors.primary,
            inactiveTrackColor: AppColors.verifyGrey,
            activeTrackColor: AppColors.primary,
            thumbColor: AppColors.primary,
            overlayColor: AppColors.primary.withAlpha(32),
            trackHeight: 6,
            disabledActiveTrackColor: AppColors.inActiveSlider,
            disabledInactiveTrackColor: AppColors.verifyGrey,
            disabledThumbColor: AppColors.inActiveSlider,
          ),
          child: RangeSlider(
              min: 0,
              max: 14,
              divisions: 14,
              labels: RangeLabels(
                _currentRangeValues.start.toStringAsFixed(0),
                _currentRangeValues.end.toStringAsFixed(0),
              ),
              values: _currentRangeValues,
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              }),
        ),
        Text(
          '${_currentRangeValues.start.toStringAsFixed(0)}  -  ${_currentRangeValues.end.toStringAsFixed(0)}',
          style: GoogleFonts.lato(
            fontSize: 15,
            color: AppColors.checkBox,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
