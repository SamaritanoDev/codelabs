import 'package:cupertino_store/src/config/theme/theme_bloc.dart';
import 'package:cupertino_store/src/models/app_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_row_item.dart';

class ProductListTab extends StatelessWidget {
  const ProductListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final products = model.getProducts();
        final themeBloc = ThemeBloc();
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: const Text('Cupertino Store'),
              trailing: CupertinoButton(
                  child: const Icon(Icons.brightness_4),
                  onPressed: () {
                    themeBloc.toggleTheme();
                  }),
            ),
            SliverSafeArea(
                top: false,
                minimum: const EdgeInsets.only(top: 0),
                sliver: SliverToBoxAdapter(
                  child: CupertinoListSection(
                    topMargin: 0,
                    children: [
                      for (var product in products)
                        ProductRowItem(
                          product: product,
                        )
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }
}
