import 'package:shopnxt/screens/login.dart';

import 'package:shopnxt/screens/v_forget2.dart';
import 'package:flutter/material.dart';

class Forget1 extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
void validation() {
  final FormState _form = _formKey.currentState;
  if (_form.validate()) {
    print("Yes");
  } else {
    print("No");
  }
}

bool obserText = true;

class _LoginState extends State<Forget1> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/login.png'), fit: BoxFit.cover),
        ),
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Forget Password? ",
                        style: TextStyle(
                            fontSize: 37, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        // ignore: missing_return
                        validator: (value) {
                          if (value == "") {
                            return "Please Enter Email id";
                          } else if (!regExp.hasMatch(value)) {
                            return "Email Is Invalid";
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email id",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: RaisedButton(
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => Forget2(),
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Text("Enter Registered Email Id only",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Container(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (ctx) => Login(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "\nLogin Here!",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
