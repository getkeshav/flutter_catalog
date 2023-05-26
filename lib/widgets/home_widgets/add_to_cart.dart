import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
   AddToCart({
    super.key,
    required this.catalog,
  });

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items
            .contains(catalog) ?? // at start isInCart will be false
        false; //if current item is in the cart then isInCart will be true, tick mark will be preserved otherwise not
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // so that no items are repeated in cart, items will not be put in the cart if it is already present
          isInCart = isInCart.toggle(); //make bool value of isInCart opposite
          final _catalog =
              CatalogModel(); //singleten fn is used here so that new value of _catalog and _cart is not initialised again and again.
          _cart.catalog = _catalog;
          _cart.add(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            context.theme.buttonColor,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
