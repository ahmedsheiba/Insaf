import 'package:flutter/material.dart';

import 'package:insaf/features/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:go_router/go_router.dart';
import 'package:insaf/core/utils/app_router.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: CartViewBody(),
      ),
    );
  }
}
