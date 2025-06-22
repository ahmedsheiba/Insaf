import 'package:flutter/material.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/broduct%20details/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
  final String name;
  final String description;
  final num price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ProductDetailsViewBody(
        name: name,
        description: description,
        price: price,
        image: image,
      ),
    );
  }
}
