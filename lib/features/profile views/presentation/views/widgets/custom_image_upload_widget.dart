import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageUploadWidget extends StatefulWidget {
  const CustomImageUploadWidget({super.key});

  @override
  State<CustomImageUploadWidget> createState() =>
      _CustomImageUploadWidgetState();
}

class _CustomImageUploadWidgetState extends State<CustomImageUploadWidget> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _isPickingImage = false;

  Future<void> _pickImage() async {
    if (_isPickingImage) return;

    setState(() {
      _isPickingImage = true;
    });

    try {
      final XFile? pickedFile = await _picker
          .pickImage(
        source: ImageSource.gallery,
      )
          .catchError((error) {
        debugPrint("Image picker error: $error");
        return null;
      });

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } finally {
      setState(() {
        _isPickingImage = false;
      });
    }
  }

  Future<void> _deleteImage() async {
    try {
      if (_imageFile != null) {
        await _imageFile!.delete();
      }
    } catch (e) {
      debugPrint("Error deleting image: $e");
    } finally {
      setState(() {
        _imageFile = null;
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
        dashPattern: [8, 8],
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
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        width: 36.w,
                        height: 36.h,
                        'assets/logos/Rectangle 1394.png',
                      ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: _isPickingImage ? null : _pickImage,
                  child: Text(
                    'Click to change photo',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      letterSpacing: 1,
                      color: _isPickingImage
                          ? Colors.grey
                          : const Color(0xff176839),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: _imageFile != null
                      ? Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
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
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: _deleteImage,
                              child: Iconify(
                                Mdi.trash_outline,
                                size: 24.sp,
                                color: const Color(0xffEB5757),
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
