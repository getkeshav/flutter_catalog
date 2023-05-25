import 'package:flutter_application_1/models/catalog.dart';

class CartModel {
  //singleten class
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() =>
      cartModel; // this class will ensure calling of fn once so that it is not again and agian initialized
  //catalog field
  late CatalogModel _catalog;
  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;
  //Set Catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds
      .map((id) => _catalog.getById(id))
      .toList(); // we'll get all the items in the cart from here

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
