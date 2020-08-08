import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_application/modal/products.dart';

class ProductItem extends StatelessWidget {
  Product product;
  var baseUrl = "https://www.vintagecellars.com.au";

  ProductItem(this.product);




  @override
  Widget build(BuildContext context) {

    debugPrint(product.image.thumbnailImage);

    return MaterialApp(
      title: 'My Dog App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Yellow Lab'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: baseUrl + product.image.heroImage,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 300,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child:Text(product.name,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                )

              ],
            ),
          ),
      ),
    ),
    );
  }
}