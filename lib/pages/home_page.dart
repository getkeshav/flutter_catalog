import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "Codepur";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      body: ListView.builder(
        itemCount: CatalogModel.items.length, //how many number of items are there in CatalogModel
        itemBuilder: (context,index){
          return ItemWidget(item:CatalogModel.items[index],);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
