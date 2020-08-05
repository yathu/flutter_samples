import 'package:firebase_provider_login/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterPage extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 35),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Password"
                        ),
                        controller: passwordController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: RaisedButton(
                        color: Colors.teal,
                        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                        child: Text("Register"),
                        onPressed: ()=>{
                          callAuthentication(context),
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

  void callAuthentication(BuildContext context) async{
    Auth auth = new Auth();

    //need to validate email
    var email = emailController.text;
    var password = passwordController.text;

    String uid = await auth.signUp(email,password);

    if (uid.length > 0 && uid != null) {
      Navigator.pushNamed(context, '/home');
    }else{
      AlertDialog(
        title: Text("ERROR"),
        content: Text(uid.toString()),
      );
    }

    debugPrint("uid: $uid");
  }
}
