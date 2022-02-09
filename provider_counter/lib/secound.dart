import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/main.dart';

class SecoundScreen extends StatelessWidget {
  const SecoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Consumer<Counter>(builder: (context,counter,child){
              return Center(child: Text(counter.count.toString()));
            })
          ],
        ),
      ),
    );
  }
}
