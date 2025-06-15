import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insaf/core/utils/app_colors.dart';

class CustomImageUploadWidget extends StatefulWidget {
  const CustomImageUploadWidget({super.key});

  @override
  State<CustomImageUploadWidget> createState() =>
      _CustomImageUploadWidgetState();
}

class _CustomImageUploadWidgetState extends State<CustomImageUploadWidget> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: const RoundedRectDottedBorderOptions(
        radius: Radius.circular(8),
        color: Color.fromRGBO(39, 174, 96, 1),
        strokeWidth: 1.4,
        dashPattern: [8, 8], // 8 pixels line, 4 pixels space,
        strokeCap: StrokeCap.butt,
        stackFit: StackFit.passthrough,
        borderPadding: EdgeInsets.all(1),
      ),
      child: Container(
        width: 340.w,
        height: 125.h,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(230, 249, 238, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _imageFile != null
                    ? Image.file(
                        _imageFile!,
                        width: 36.w,
                        height: 36.h,
                      )
                    : Image.asset(
                        width: 36.w,
                        height: 36.h,
                        'assets/logos/Rectangle 1394.png',
                      ),
                GestureDetector(
                  onTap: _pickImage,
                  child: Text(
                    'Click to change photo',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      letterSpacing: 1,
                      color: AppColors.editPenColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 12.w,
                  ),
                  child: _imageFile != null
                      ? Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: AppColors.inActiveSlider,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(24),
                                ),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Color(0xff176839),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Upload complete.',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                letterSpacing: 1,
                                color: AppColors.arrowLeft,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () async {
                                if (_imageFile != null) {
                                  await _imageFile!.delete(); // delete the file
                                  setState(() {
                                    _imageFile = null;
                                  });
                                }
                              },
                              child: Iconify(
                                Mdi.trash_outline,
                                size: 24.sp,
                                color: AppColors.errorColor,
                              ),
                            )
                          ],
                        )
                      : const SizedBox(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
