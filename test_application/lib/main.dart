import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_application/productItem.dart';

import 'modal/products.dart';
import 'modal/products.dart';

// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as ImageN;
import 'package:cached_network_image/cached_network_image.dart';


Future<GetProducts> fetchProducts() async {
  final response =
  await http.get(
      'https://raw.githubusercontent.com/yathu/Recepi-Api/master/products.json');
//  await http.get('https://raw.githubusercontent.com/yathu/Recepi-Api/master/productNew.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return GetProducts.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<GetProducts> productsList;
  var baseUrl = "https://www.vintagecellars.com.au";


  @override
  void initState() {
    super.initState();
    productsList = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<GetProducts>(
            future: productsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new ListView.builder
                  (
                    itemCount: snapshot.data.products.length,
                    itemBuilder: (BuildContext context, int index) {
//                      return listItem(snapshot.data.products,index,context);
//                      return new Text(snapshot.data.products[index].name);
                      return InkWell(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Container(
                                      child: CachedNetworkImage(
                                        imageUrl: baseUrl +
                                            snapshot.data.products[index].image
                                                .thumbnailImage,
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      padding: EdgeInsets.all(10.0),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                                      child: Text(
                                        snapshot.data.products[index].name,
                                        style: TextStyle(fontSize: 20,),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                ProductItem(snapshot.data.products[index])),
                          );
                        },
                      );

                    }
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

}
