import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/features/products/product_model.dart';

import '../../products/model/user_model.dart';
import '../../products/widgets/card/shop_card.dart';
import 'products_view_model.dart';

class ProductsView extends ProductsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        actions: [
          _actionChipTotalMoney(),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ShopCard(
            product: Product(
              name: 'Product $index',
              price: index * 10,
              image: 'https://picsum.photos/200',
            ),
          );
        },
      ),
    );
  }

  ActionChip _actionChipTotalMoney() {
    return ActionChip(
      avatar: const Icon(
        Icons.check,
        color: Colors.green,
      ),
      label: Text('${context.watch<User>().basketTotalMoney} TL '),
      onPressed: () {},
    );
  }
}
