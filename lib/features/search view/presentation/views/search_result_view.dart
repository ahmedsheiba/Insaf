import 'package:flutter/material.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/result_app_bar.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/search_result_view_body.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ResultAppBar(),
          Expanded( 
            child: SearchResultViewBody(),
          ),
        ],
      ),
    );
  }
}