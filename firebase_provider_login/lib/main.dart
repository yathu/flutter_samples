import 'package:firebase_provider_login/Home.dart';
import 'package:firebase_provider_login/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/home': (context) => HomePage(),
    },
  ));
}

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0,15, 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: ("Email"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 35),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Password"
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: RaisedButton(
                        color: Colors.teal,
                        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                        child: Text("Login"),
                        onPressed: ()=>{},
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("not registered? "),
                        new GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text("Create an account",style: TextStyle(color: Colors.green),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


