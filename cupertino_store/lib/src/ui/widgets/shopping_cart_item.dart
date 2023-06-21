import 'package:cupertino_store/src/config/styles.dart';
import 'package:cupertino_store/src/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    required this.index,
    required this.product,
    required this.lastItem,
    required this.quantity,
    required this.formatter,
    super.key,
  });

  final Product product;
  final int index;
  final bool lastItem;
  final int quantity;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      child: CupertinoListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            product.assetName,
            package: product.assetPackage,
            fit: BoxFit.cover,
            width: 40,
            height: 40,
          ),
        ),
        leadingSize: 40,
        title: Text(
          product.name,
          style: Styles.productRowItemName,
        ),
        subtitle: Text(
          '${quantity > 1 ? '$quantity x ' : ''}'
          '${formatter.format(product.price)}',
          style: Styles.productRowItemPrice,
        ),
        trailing: Text(
          formatter.format(quantity * product.price),
          style: Styles.productRowItemName,
        ),
      ),
    );

    return row;
  }
}
