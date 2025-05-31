import 'package:flutter/material.dart';
import 'package:insaf/features/Home/presentation/views/widgets/categories_product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: 12,
      addAutomaticKeepAlives: true, // Preserves state
      cacheExtent: 500, // Pre-cache offscreen items
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const CategoriesProductItem(); // Ensure this is const
      },
    );
  }
}
