import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/features/products/product_model.dart';

import '../../model/user_model.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: _buildSizedBoxImage(context),
        subtitle: _buildWrapSubtitle(),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_basket),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildWrapSubtitle() {
    return Wrap(
      spacing: 10,
      children: [
        Text(product.name ?? ''),
        Text('\$${product.price ?? 0}'),
      ],
    );
  }

  Widget _buildSizedBoxImage(BuildContext context) => Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.network('${product.image}'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            color: Colors.black12,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<User>().decrementProduct(product);
                  },
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),
                Text(context.read<User>().basketProducts[product]?.toString() ?? '0'),
                IconButton(
                  onPressed: () {
                    if (context.read<User>().basketProducts.isEmpty) {
                      context.read<User>().addFirstItemToBasket(product);
                    } else {
                      context.read<User>().incrementProduct(product);
                    }
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          )
        ],
      );
}
