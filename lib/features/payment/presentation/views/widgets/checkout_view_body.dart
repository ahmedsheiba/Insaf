import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/features/payment/presentation/views/widgets/card_widget.dart';
import 'package:insaf/features/payment/presentation/views/widgets/payment_method_widget.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  String? selectedPaymentMethod;
  bool hasSavedCard = false;

  void selectPayment(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  bool get canConfirmPayment => selectedPaymentMethod != null && hasSavedCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: GoogleFonts.rubik(
                    fontSize: 24.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PaymentMethodWidget(
                        imageName: 'cash',
                        imageHeight: 26,
                        imageWidth: 26,
                        paymentMethod: 'Cash',
                        isSelected: selectedPaymentMethod == 'Cash',
                        onTap: () => selectPayment('Cash'),
                      ),
                      SizedBox(width: 11.w),
                      PaymentMethodWidget(
                        imageName: 'visa',
                        imageHeight: 26,
                        imageWidth: 26,
                        paymentMethod: 'Visa',
                        isSelected: selectedPaymentMethod == 'Visa',
                        onTap: () => selectPayment('Visa'),
                      ),
                      SizedBox(width: 11.w),
                      PaymentMethodWidget(
                        imageName: 'master',
                        imageHeight: 26,
                        imageWidth: 26,
                        paymentMethod: 'Mastercard',
                        isSelected: selectedPaymentMethod == 'Mastercard',
                        onTap: () => selectPayment('Mastercard'),
                      ),
                      SizedBox(width: 11.w),
                      PaymentMethodWidget(
                        imageName: 'paypal',
                        imageHeight: 26,
                        imageWidth: 26,
                        paymentMethod: 'PayPal',
                        isSelected: selectedPaymentMethod == 'PayPal',
                        onTap: () => selectPayment('PayPal'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.h),
                Container(
                  width: 345.w,
                  height: 257.h,
                  decoration: BoxDecoration(
                    color: AppColors.verifyGrey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: hasSavedCard ? buildSavedCardWidget() : CardWidget(),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 52.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(AppColors.white),
                      overlayColor: const WidgetStatePropertyAll(
                          AppColors.greenWithOpacity),
                      elevation: const WidgetStatePropertyAll(0),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(
                            color: AppColors.primary,
                            width: 1.w,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kAddCardView);
                    },
                    child: Text(
                      '+ Add Card',
                      style: GoogleFonts.lato(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  height: 52.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        canConfirmPayment
                            ? AppColors.primary
                            : AppColors.verifyGrey,
                      ),
                      overlayColor: const WidgetStatePropertyAll(
                          AppColors.greenWithOpacity),
                      elevation: const WidgetStatePropertyAll(0),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                    onPressed: canConfirmPayment
                        ? () {
                            // Confirm payment logic here
                          }
                        : null,
                    child: Text(
                      'Confirm Payment',
                      style: GoogleFonts.lato(
                        color: canConfirmPayment
                            ? AppColors.white
                            : AppColors.verifyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSavedCardWidget() {
    // Build your saved card UI here
    return Center(
      child: Text("Saved Card UI Placeholder"),
    );
  }
}
