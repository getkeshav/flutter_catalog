import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items
            .contains(widget.catalog) ?? // at start isInCart will be false
        false; //if current item is in the cart then isInCart will be true, tick mark will be preserved otherwise not
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // so that no items are repeated in cart, items will not be put in the cart if it is already present
          isInCart = isInCart.toggle(); //make bool value of isInCart opposite
          final _catalog =
              CatalogModel(); //singleten fn is used here so that new value of _catalog and _cart is not initialised again and again.
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
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
