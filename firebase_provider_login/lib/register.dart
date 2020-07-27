import 'package:firebase_provider_login/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
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
                        child: Text("Register"),
                        onPressed: ()=>{
                          callAuthentication(),
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("already registered? "),
                        new GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text("Login",style: TextStyle(color: Colors.green),),
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

  void callAuthentication(){
    Auth auth = new Auth();
    var uid = auth.signUp("yathavancom@gmail.com", "123456");
    debugPrint("uid: $uid");
  }
}
