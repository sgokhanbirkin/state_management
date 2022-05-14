import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/features/basket/basket_view_model.dart';

import '../../products/model/user_model.dart';

class BasketView extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<User>().basketItems.length,
              itemBuilder: (context, index) {
                final product = context.watch<User>().basketItems[index];
                return Column(
                  children: [
                    Image.network(product.image ?? ''),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(product.name ?? ''),
                        Text('${product.price} TL'),
                        Text('Total : ${product.total}'),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: context.watch<User>().basketTotalMoney > 100 ? () {} : null,
            child: const Text('Buy All (min 100 TL )'),
          ),
        ],
      ),
    );
  }
}
