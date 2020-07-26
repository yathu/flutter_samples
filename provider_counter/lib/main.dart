import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => Counter(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<Counter>(
              builder: (context, counter, child) {
                return Text(
                  "counter value is: ${counter.count}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            new RaisedButton(
              padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
              textColor: Colors.white,
              color: Colors.blue,
              child: new Text("Reset Count"),
              onPressed: ()=> Provider.of<Counter>(context,listen: false).reset(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
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

  void reset(){
    count = 0;
    notifyListeners();
  }
}
