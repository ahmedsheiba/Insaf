import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class DistanceSlider extends StatefulWidget {
  const DistanceSlider({super.key});

  @override
  State<DistanceSlider> createState() => _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {
  double _currentDistance = 0;

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
          ),
          child: Slider(
            padding: EdgeInsets.zero,
            min: 0,
            max: 50,
            value: _currentDistance,
            divisions: 50,
            onChanged: (value) {
              setState(() {
                _currentDistance = value.round().toDouble();
              });
            },
            label: _currentDistance.toString(),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _currentDistance.toString(),
          style: GoogleFonts.lato(
            fontSize: 15,
            color: AppColors.checkBox,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
