import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gratis/routes/getStarted.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Gratis",
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color(0xFF54d3c2),
        disabledColor: Colors.red,
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
