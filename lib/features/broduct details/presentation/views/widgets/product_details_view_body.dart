import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/broduct%20details/presentation/views/widgets/cart_bottomsheet.dart';

class ProductDetailsViewBody extends StatelessWidget {
  ProductDetailsViewBody({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  final TextEditingController qtyController = TextEditingController(text: '1');

  final String name;
  final String description;
  final num price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Product Details',
          style: GoogleFonts.rubik(
            color: AppColors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                width: 345.w,
                height: 153.h,
              ),
              Text(
                name,
                style: GoogleFonts.lato(
                    color: AppColors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                'EGP $price',
                style: GoogleFonts.lato(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
              Text(
                description,
                style: GoogleFonts.lato(
                  color: AppColors.cursor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 22.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: AppColors.cursor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logos/vgarden.png',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          'Vgarden',
                          style: GoogleFonts.lato(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: AppColors.cursor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.w,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          '6th october city, giza, egypt',
                          style: GoogleFonts.lato(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.greenWithOpacity,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Image.asset('assets/logos/available.png'),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available Quantity',
                            style: GoogleFonts.lato(
                              color: AppColors.verifyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            '50 packs',
                            style: GoogleFonts.lato(
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.greenWithOpacity,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Image.asset('assets/logos/expires.png'),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expires in',
                            style: GoogleFonts.lato(
                              color: AppColors.verifyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            '1 month left',
                            style: GoogleFonts.lato(
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.greenWithOpacity,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Image.asset('assets/logos/distance.png'),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Distance',
                            style: GoogleFonts.lato(
                              color: AppColors.verifyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            '900 m away from you',
                            style: GoogleFonts.lato(
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                width: double.infinity,
                height: 70.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56.w,
                      height: 52.h,
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'QTY',
                            style: GoogleFonts.lato(
                              fontSize: 12.sp,
                              color: AppColors.textRate,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: qtyController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: GoogleFonts.lato(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 52.h,
                        width: 273.w,
                        child: ElevatedButton(
                          onPressed: () {
                            String qty = qtyController.text;
                            showAddToCartBottomSheet(context, 635);
                            print("Add $qty item(s) to cart");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Add To Cart',
                            style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
