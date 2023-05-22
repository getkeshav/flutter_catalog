import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    //state when class is initialised, state before build method is called
    // so if we have calculated data before build method we can give give it to build method
    super.initState();
    loadData(); // method to load data of json file
  }

  loadData() async {
    await Future.delayed(Duration(
        seconds:
            2)); // it'll take some time to fetch the data from json file so we will wait till 2 sec and put loading icon at that place
    final catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); // it'll take some time(as loadstring is a future widget) to load data from json file so await is there
    final decodedData = jsonDecode(
        catalogJson); //loaded data is in the form of string but we need objects, so decoding is done , jsonDecode gives dynamic value(like map)
    //Decoding= String to Object ,, Decoding = Object to String , here object is map
    //decodedData will give us object (whole json file is an object)
    var productData =
        decodedData["products"]; // taking products from decoded data/object
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {
      //calling build again and again so that every entry comes not only one
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
        body: Container(
      padding: Vx.m32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Catalogheader(),
          if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
          CatalogList()
          else
          Center(child: CircularProgressIndicator(),)
        ],
      ),
    ));
  }
}
class Catalogheader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
          "Trending Products".text.xl2.make(),
        ],
      );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      final catalog = CatalogModel.items[index];
      return CatalogItem(catalog:catalog);
    });
  }
}

class CatalogItem extends StatelessWidget {
  final catalog;

  const CatalogItem({super.key, required this.catalog}):assert (catalog!=null); //assert gives warning in debugger if this thing gets null
  @override
  Widget build(BuildContext context) {
    return VxBox(child: Row(children: [Image.network(catalog.image)],)).white.square(100).make().py16();
  }
}