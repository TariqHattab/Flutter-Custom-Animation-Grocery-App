import 'package:animation_2/controllers/home_controller.dart';
import 'package:animation_2/screens/home/components/cart_detailsview_card.dart';
import 'package:flutter/material.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cart',
              style: Theme.of(context).textTheme.headline6,
            ),
            ...List.generate(
              controller.cart.length,
              (index) =>
                  CartDetailsViewCard(productItem: controller.cart[index]),
            ),
            if (controller.cart.length != 0)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('check out'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
