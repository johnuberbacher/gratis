import 'package:flutter/material.dart';
import 'package:gratis/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
                    "Sign up",
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
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              //  style: TextStyle(
                              //    color: Theme.of(context).primaryColor),
                              keyboardType: TextInputType.text,
                              decoration: elevatedTextFieldInputDecoration(
                                  context, "First Name"),
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
                              keyboardType: TextInputType.text,
                              decoration: elevatedTextFieldInputDecoration(
                                  context, "Last Name"),
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
                              keyboardType: TextInputType.text,
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
                              keyboardType: TextInputType.text,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
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
                            left: 30.0,
                            right: 30.0,
                          ),
                          width: double.infinity,
                          child: Text(
                            'By signing up, you agree with our Terms of Services and Privacy Policy.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF9f9f9f),
                              fontSize: 13,
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
