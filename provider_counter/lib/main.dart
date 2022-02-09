import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/secound.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Counter(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> SecoundScreen(),
                        ));
                  },
                  child: Text("navigate")),
              ElevatedButton(onPressed: () {
                Provider.of<Counter>(context,listen: false).increment();
              }, child: Text("insert")),
            ],
          ),
          Consumer<Counter>(
            builder: (context, counter, child) {
              return Center(
                child: Column(
                  children: [
                    Text(counter.count.toString()),
                    if (child != null) child,
                  ],
                ),
              );
            },
            child: Column(
              children: [
                ElevatedButton(onPressed: () => {}, child: Text("clear"))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.wc),
        onPressed: () {
          Provider.of<Counter>(context, listen: false).reset();
        },
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int count = 0;

  void increment() {
    count += 1;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}
