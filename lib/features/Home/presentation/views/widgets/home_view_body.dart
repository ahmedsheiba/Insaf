import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insaf/core/utils/api_service.dart';
import 'package:insaf/core/utils/app_colors.dart';
import 'package:insaf/features/Home/data/repos/home_repo_imple.dart';
import 'package:insaf/features/Home/presentation/view%20model/surpluses%20cubit/surpluses_cubit.dart';
import 'package:insaf/features/Home/presentation/views/widgets/categories_grid.dart';
import 'package:insaf/features/Home/presentation/views/widgets/custom_appbar.dart';
import 'package:insaf/features/Home/presentation/views/widgets/offer_widget.dart';
import 'package:insaf/features/Home/presentation/views/widgets/suggested_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            const OfferWidget(),
            CategoriesSection(),
            BlocProvider(
              create: (context) => SurplusesCubit(
                HomeRepoImplement(
                  ApiService(
                    Dio(),
                  ),
                ),
              )..fetchSearchBooks(),
              child: const SuggestedSection(),
            ),
          ],
        ),
      ),
    );
  }
}
