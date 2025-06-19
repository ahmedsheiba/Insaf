import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insaf/core/utils/app_router.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kCheckoutView);
              },
              child: Text('checkout'))),
    );
  }
}
