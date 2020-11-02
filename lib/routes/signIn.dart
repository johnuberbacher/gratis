import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gratis/routes/getStarted.dart';
import 'package:gratis/routes/home.dart';
import 'package:gratis/widgets.dart';
import 'package:gratis/database.dart';
import 'package:gratis/services/auth.dart';
import 'package:gratis/services/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  AuthMethods authService = new AuthMethods();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((result) async {
        if (result != null) {
          QuerySnapshot userInfoSnapshot = await DatabaseMethods()
              .getUserInfo(emailTextEditingController.text);

          CheckSharedPreferences.saveUserLoggedInSharedPreference(true);
          CheckSharedPreferences.saveNameSharedPreference(
              userInfoSnapshot.docs[0].data()["name"]);
          CheckSharedPreferences.saveUserEmailSharedPreference(
              userInfoSnapshot.docs[0].data()["email"]);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          setState(() {
            isLoading = false;
            // TODO
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authenticate()));
            },
          ),
        ),
        backgroundColor: Color(0xFFf6f6f6),
        body: Center(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(
                top: 80.0,
                left: 30.0,
                right: 30.0,
                bottom: 30.0,
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  Divider(
                    height: 30,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                    style: TextStyle(
                      color: Color(0xFF9f9f9f),
                      fontSize: 16,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.075),
                                    offset: Offset(0, 10),
                                    blurRadius: 15,
                                    spreadRadius: 0),
                              ],
                            ),
                            child: TextFormField(
                              controller: emailTextEditingController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+|.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Please enter a valid email address";
                              },
                              decoration: elevatedTextFieldInputDecoration(
                                  context, "Email Address"),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.075),
                                    offset: Offset(0, 10),
                                    blurRadius: 15,
                                    spreadRadius: 0),
                              ],
                            ),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "Password must be greater than 6 characters";
                              },
                              controller: passwordTextEditingController,
                              textCapitalization: TextCapitalization.none,
                              decoration: elevatedPasswordInputDecoration(
                                  context, "Password"),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 30.0,
                          ),
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              signIn();
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 30.0,
                          ),
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GetStarted(),
                                ),
                              );
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Don't have an account?",
                                    style: TextStyle(
                                      color: Color(0xFF9f9f9f),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  Sign up',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
