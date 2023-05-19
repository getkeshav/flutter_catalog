import 'package:flutter/material.dart';

import '../models/catalog.dart';
class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({super.key, required this.item}):assert(item!=null);
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}