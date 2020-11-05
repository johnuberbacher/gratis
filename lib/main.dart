import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gratis/routes/getStarted.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gratis/routes/home.dart';
import 'package:gratis/services/shared_preferences.dart';
import 'package:gratis/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setEnabledSystemUIOverlays([]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;
  @override
  void initState() {
    getLoggedInState();
    super.initState();
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment =
        false; //<--
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF1f1e30),
        systemNavigationBarColor: Color(0xFF1f1e30),
      ),
    );
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Gratis",
      debugShowCheckedModeBanner: false,
      home: userIsLoggedIn != null
          ? userIsLoggedIn ? HomeScreen() : GetStarted()
          : GetStarted(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color(0xFF54d3c2),
        disabledColor: Colors.red,
        splashColor: Color(0xFF54d3c2),
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15.0,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: BorderSide(
                color: Color(0xFF54d3c2),
              )),
          buttonColor: Color(0xFF54d3c2),
          textTheme:
              ButtonTextTheme.primary, //  <-- this auto selects the right color
        ),
      ),
    );
  }
}
