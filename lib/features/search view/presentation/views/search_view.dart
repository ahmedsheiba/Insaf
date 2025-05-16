import 'package:flutter/material.dart';
import 'package:insaf/features/search%20view/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}
