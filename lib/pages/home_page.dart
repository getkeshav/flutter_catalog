import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

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
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Image.network(item.image),
                        footer: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                      ));
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
