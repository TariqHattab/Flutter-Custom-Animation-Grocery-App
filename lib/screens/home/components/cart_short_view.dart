import 'package:animation_2/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartShortView extends StatelessWidget {
  const CartShortView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // padding: const EdgeInsets.all(defaultPadding),
      color: Color(0xFFEAEAEA),
      width: double.infinity,
      child: Row(
        children: [
          Text(
            'Cart:',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            width: defaultPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  controller.cart.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 4),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      // radius: 50,
                      child: Hero(
                          tag: controller.cart[index].product!.title! +
                              '_cartTag',
                          child: Image.asset(
                              controller.cart[index].product!.image!)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('${controller.totalItemsInCart()}'),
          )
        ],
      ),
    );
  }
}
