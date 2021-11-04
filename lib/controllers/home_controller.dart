import 'package:animation_2/models/Product.dart';
import 'package:animation_2/models/ProductItem.dart';
import 'package:flutter/material.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState _homeState = HomeState.normal;

  List<ProductItem> _cart = [];

  List<ProductItem> get cart => _cart;

  void addProductToCart(Product product) {
    for (ProductItem item in _cart) {
      if (item.product!.title == product.title) {
        item.increment();
        notifyListeners();
        return;
      }
    }

    _cart.add(ProductItem(product: product));
    notifyListeners();
  }

  int totalItemsInCart() => _cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  HomeState get homeState => _homeState;

  void changeHomeState(HomeState state) {
    _homeState = state;
    notifyListeners();
  }
}
