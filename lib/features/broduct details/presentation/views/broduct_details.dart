import 'package:flutter/material.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/broduct%20details/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.white, body: ProductDetailsViewBody());
  }
}
