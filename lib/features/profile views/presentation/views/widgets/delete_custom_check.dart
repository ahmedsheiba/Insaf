import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';

class DeleteCustomCheck extends StatefulWidget {
  const DeleteCustomCheck({super.key, this.onChanged});

  final ValueChanged<bool>? onChanged;

  @override
  State<DeleteCustomCheck> createState() => _DeleteCustomCheckState();
}

class _DeleteCustomCheckState extends State<DeleteCustomCheck> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: const BorderSide(width: 1),
          ),
          activeColor: AppColors.editPenColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChanged?.call(isChecked); // Call the callback
            });
          },
        ),
        Text(
          'I understand that my data will be permanently\n deleted and want to delete my account. ',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
            color: AppColors.arrowLeft,
          ),
        )
      ],
    );
  }
}
