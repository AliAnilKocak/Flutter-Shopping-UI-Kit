import 'package:flutter/material.dart';
import 'package:fluttercommerce/screens/login.dart';
import 'package:fluttercommerce/screens/verifynumber.dart';
import 'package:fluttercommerce/widgets/edittext.dart';
import 'package:fluttercommerce/widgets/submitbutton.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    "Register account",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                EditText(title: "Name"),
                EditText(title: "Surname"),
                EditText(title: "Email"),
                EditText(title: "Password"),
                SubmitButton(
                  title: "Register",
                  act: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyScreeen(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already exist account? ",
                        style: TextStyle(fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
