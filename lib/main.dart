import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insaf/core/utils/app_router.dart';

void main() {
  runApp(const Insaf());
}

class Insaf extends StatelessWidget {
  const Insaf({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const  Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
