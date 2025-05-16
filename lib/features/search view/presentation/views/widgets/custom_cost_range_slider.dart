import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class CustomCostRangeSlider extends StatefulWidget {
  const CustomCostRangeSlider({
    super.key,
    this.isEnabled = true,
  });

  final bool isEnabled;

  @override
  State<CustomCostRangeSlider> createState() => _CustomCostRangeSliderState();
}

class _CustomCostRangeSliderState extends State<CustomCostRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(0, 500);

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
            max: 500,
            divisions: 500,
            labels: RangeLabels(
              _currentRangeValues.start.toStringAsFixed(0),
              _currentRangeValues.end.toStringAsFixed(0),
            ),
            values: _currentRangeValues,
            onChanged: widget.isEnabled
                ? (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  }
                : null,
          ),
        ),
        Text(
          '${_currentRangeValues.start.toStringAsFixed(0)} EG  -  ${_currentRangeValues.end.toStringAsFixed(0)} EG',
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
