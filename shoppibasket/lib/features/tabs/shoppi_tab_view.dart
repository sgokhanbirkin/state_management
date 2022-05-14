import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/features/basket/basket.dart';
import 'package:shoppibasket/features/products/products.dart';

import '../../products/model/user_model.dart';

class ShoppiTabView extends StatelessWidget {
  const ShoppiTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: _bottomAppBar(context),
        body: const TabBarView(
          children: [
            Products(),
            Basket(),
          ],
        ),
      ),
    );
  }

  TabBar _bottomAppBar(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      tabs: [
        const Tab(
          icon: Icon(Icons.home),
        ),
        Tab(
          child: Stack(
            children: [
              const Icon(Icons.shopping_basket),
              Positioned(
                top: 0,
                right: 0,
                height: 10,
                width: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    context.watch<User>().totalProduct.toString(),
                    style: Theme.of(context).textTheme.overline?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
