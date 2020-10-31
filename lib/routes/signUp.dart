import 'package:flutter/material.dart';
import 'package:gratis/routes/home.dart';
import 'package:gratis/routes/signIn.dart';
import 'package:gratis/widgets.dart';
import 'package:gratis/database.dart';
import 'package:gratis/services/auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameTextEditingController =
      new TextEditingController();
  TextEditingController firstNameLowercaseTextEditingController =
      new TextEditingController();
  TextEditingController lastNameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  signUpAccount() {
    if (formKey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "name": firstNameTextEditingController.text,
        "email": emailTextEditingController.text
      };

      HelperFunctions.saveUserNamePreference(
          firstNameTextEditingController.text);
      HelperFunctions.saveUserEmailPreference(emailTextEditingController.text);

      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((val) {
        databaseMethods.setUserInfo(userInfoMap);
        HelperFunctions.saveUserLoggedInPreference(true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: firstNameTextEditingController,
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
                              controller: lastNameTextEditingController,
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
                              signUpAccount();
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
                            top: 15.0,
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
                        Container(
                          margin: const EdgeInsets.only(
                            top: 30.0,
                          ),
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(
                                      color: Color(0xFF9f9f9f),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  Login instead',
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
