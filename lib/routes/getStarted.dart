import 'package:flutter/material.dart';
import 'package:gratis/routes/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gratis/widgets.dart';
import 'package:gratis/routes/signUp.dart';
import 'package:gratis/routes/signIn.dart';
import 'package:gratis/services/auth.dart';
import 'package:gratis/services/shared_preferences.dart';

class GetStarted extends StatefulWidget {
  final Function toggleView;
  GetStarted(this.toggleView);
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/getStartedBg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.grey.withOpacity(0.3), BlendMode.difference),
          ),
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 70.0,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 30.0,
                        ),
                        width: 110.0,
                        height: 110.0,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            "assets/images/gratis-light.png",
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF54d3c2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15.0,
                        ),
                        child: Text(
                          "Gratís",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      Text(
                        "Luxury rentals and hotels",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        child: Text(
                          "Let's Get Started",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(
                          "Already have an account? Log in",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
