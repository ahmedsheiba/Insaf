import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/lucide.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:insaf/core/utils/app_colors.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.onTap});

  final void Function() onTap;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int cartItemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      width: 345.w,
      height: 124.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(51, 51, 51, 0.08),
            blurRadius: 18,
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            width: 90.w,
            height: 100.h,
            'assets/logos/tuna.png',
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              Text(
                'Plant Based Tuna',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  color: AppColors.arrowLeft,
                ),
              ),
              Text(
                'EGP 12.00',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: AppColors.cursor,
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      border: Border.all(
                        color: const Color(0xffBDC3C7),
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (cartItemCount == 1) {
                              } else {
                                cartItemCount--;
                              }
                            });
                          },
                          child: Iconify(
                            Lucide.minus,
                            size: 18.sp,
                            color: AppColors.checkBox,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Container(
                            alignment: Alignment.center,
                            width: 36.w,
                            height: 26.h,
                            decoration: const BoxDecoration(
                              color: Color(0xffF4F4F4),
                            ),
                            child: Text(
                              cartItemCount.toString(),
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: AppColors.checkBox,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              cartItemCount++;
                            });
                          },
                          child: Iconify(
                            Lucide.plus,
                            size: 18.sp,
                            color: AppColors.checkBox,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Iconify(
                      Mdi.trash_outline,
                      size: 24.sp,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
