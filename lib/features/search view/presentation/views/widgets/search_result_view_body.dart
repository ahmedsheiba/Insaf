import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/item_count_and_sort.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/products_grid_view.dart';

class SearchResultViewBody extends StatelessWidget {
  const SearchResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          const ItemCountAndSort(),
          SizedBox(height: 5.h),
          const Expanded(
            child: ProductsGridView(),
          ),
        ],
      ),
    );
  }
}
