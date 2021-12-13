import 'package:shopnxt/screens/homepage.dart';
import 'package:shopnxt/screens/login.dart';
import 'package:flutter/material.dart';

class Forget2 extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<Forget2> {
  void vaildation() {
    final FormState _form = _formKey.currentState;
    if (_form.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/login.png'), fit: BoxFit.cover),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 170,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormField(
                          // ignore: missing_return
                          validator: (value) {
                            if (value == "") {
                              return "Please Enter Email id";
                            } else if (!regExp.hasMatch(value)) {
                              return "Please Enter Valid Email id";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Email id",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          obscureText: obserText,
                          // ignore: missing_return
                          validator: (value) {
                            if (value == "") {
                              return "Please Enter Password";
                            } else if (value.length < 8) {
                              return "Password Is Too Short";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                obserText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          obscureText: obserText,
                          // ignore: missing_return
                          validator: (value) {
                            if (value == "") {
                              return "Please Enter Password";
                            } else if (value.length < 8) {
                              return "Password Is Too Short";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                obserText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              color: Colors.red,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => HomePage(),
                                  ),
                                );
                              }),
                        ),
                        Row(
                          children: <Widget>[
                            Text("Make Sure You Remember Your New Password"),
                            SizedBox(
                              width: 13,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => Login(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
