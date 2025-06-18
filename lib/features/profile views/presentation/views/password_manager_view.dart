import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/passord_manager_view_body.dart';

class PasswordManagerView extends StatelessWidget {
  const PasswordManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: const Color.fromRGBO(244, 244, 244, 1),

      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 24.w,
        ),
        child: const PassordManagerViewBody(),
      ),
    );
  }
}
