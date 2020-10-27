import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Color(0xFFf6f6f6),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(
              top: 30.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            width: double.infinity,
            child: Column(
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
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "What's your First Name?",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 3.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 3.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 30.0,
                              ),
                            ),
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
                            decoration: InputDecoration(
                              hintText: "What's your First Name?",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 3.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 3.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 30.0,
                              ),
                            ),
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
                              MaterialPageRoute(builder: (context) => SignUp()),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
