import 'package:flutter/material.dart';
import 'package:insaf/features/profile%20views/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: ProfileViewBody(),
    );
  }
}
