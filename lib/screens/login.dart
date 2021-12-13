import 'package:shopnxt/screens/signup.dart';
import 'package:shopnxt/screens/v_forget1.dart';
import 'package:shopnxt/widgets/changescreen.dart';
import 'package:shopnxt/widgets/mytextformField.dart';
import 'package:shopnxt/widgets/passwordtextformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/mybutton.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool isLoading = false;
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
final TextEditingController email = TextEditingController();
final TextEditingController userName = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final TextEditingController password = TextEditingController();

bool obserText = true;

class _LoginState extends State<Login> {
  void submit(context) async {
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);
      print(result);
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message.toString()),
          duration: Duration(milliseconds: 800),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 1500),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    }

    setState(() {
      isLoading = false;
    });
  }

  void vaildation() async {
    if (email.text.isEmpty && password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email id / password"),
        ),
      );
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill email id"),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter vaild email id"),
        ),
      );
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill password"),
        ),
      );
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password  is too short"),
        ),
      );
    } else {
      submit(context);
    }
  }

  Widget _buildAllPart() {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextFormField(
                  name: "Email",
                  controller: email,
                ),
                SizedBox(
                  height: 10,
                ),
                PasswordTextFormField(
                  obserText: obserText,
                  name: "Password",
                  controller: password,
                  onTap: () {
                    //ontap
                    FocusScope.of(context).unfocus();
                    setState(() {
                      obserText = !obserText;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                isLoading == false
                    ? MyButton(
                        onPressed: () {
                          vaildation();
                        },
                        name: "Login",
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                ChangeScreen(
                    name: "Create one!",
                    whichAccount: "No account?",
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => SignUp(),
                        ),
                      );
                    }),
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => Forget1(),
                            ),
                          );
                        },
                        child: Text(
                          "\nForget Password",
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/login.png'), fit: BoxFit.cover),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildAllPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
