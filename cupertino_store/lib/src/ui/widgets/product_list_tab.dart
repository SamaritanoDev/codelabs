import 'package:cupertino_store/src/models/app_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductListTab extends StatelessWidget {
  const ProductListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final products = model.getProducts();
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: const <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Cupertino Store'),
            ),
          ],
        );
      },
    );
  }
}
