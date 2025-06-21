import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insaf/core/utils/app_router.dart';
import 'package:insaf/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:insaf/features/auth%20views/data/repos/auth_repo_impl.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/cubit/login_cubit.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/cubit/reset_password_cubit.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/cubit/reset_verify_email_cubit.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/cubit/verify_email_cubit.dart';
import 'package:insaf/features/auth%20views/presentation/view_model/register/cubit/register_cubit.dart';

void main() {
  runApp(const Insaf());
}

class Insaf extends StatelessWidget {
  const Insaf({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthRepoImplement(ApiService(Dio()));

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => RegisterCubit(authRepo)),
            BlocProvider(create: (_) => LoginCubit(authRepo)),
            BlocProvider(create: (_) => VerifyEmailCubit(authRepo)),
            BlocProvider(create: (_) => ResetPasswordCubit(authRepo)),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
