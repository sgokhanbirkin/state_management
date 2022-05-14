import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/products/service/user_service.dart';

import '../../features/products/product_model.dart';

class User extends ChangeNotifier {
  Map<Product, int> basketProducts = {};

  late UserService service;

  User(BuildContext context) {
    service = context.read<UserService>();
  }

  List<Product> get basketItems => basketProducts.keys.toList();

  double get basketTotalMoney {
    if (basketProducts.isEmpty) {
      return 0;
    } else {
      double total = 0;
      basketProducts.forEach(
        (key, value) {
          total += (key.price ?? 0) * value;
        },
      );
      return total;
    }
  }

  void addFirstItemToBasket(Product product) {
    basketProducts[product] = 1;
    service.addProduct(product);
    notifyListeners();
  }

  void incrementProduct(Product product) {
    if (basketProducts.containsKey(product)) {
      basketProducts[product] = basketProducts[product]! + 1;
    } else {
      basketProducts[product] = 1;
    }

    notifyListeners();
  }

  void decrementProduct(Product product) {
    if (basketProducts.containsKey(product)) {
      if (basketProducts[product]! > 1) {
        //basketProducts[product] = basketProducts[product]! - 1;
        basketProducts.removeWhere((key, value) => key == product);
      } else {
        basketProducts.remove(product);
      }
    }

    notifyListeners();
  }

  int get totalProduct {
    if (basketProducts.isEmpty) {
      return 0;
    } else {
      int total = 0;
      basketProducts.forEach(
        (key, value) {
          total++;
        },
      );
      return total;
    }
  }
}
