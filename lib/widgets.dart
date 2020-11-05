import 'package:flutter/material.dart';

Widget sectionTitle(String title) {
  return Container(
    margin: const EdgeInsets.only(
      left: 20.0,
      right: 20.0,
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: Text(
        capitalize(title),
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
    ),
  );
}

InputDecoration elevatedTextFieldInputDecoration(context, String hintText) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 25,
    ),
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.transparent, width: 3.0),
    ),
    errorStyle: TextStyle(height: 0),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.red, width: 3.0),
    ),
  );
}

InputDecoration elevatedPasswordInputDecoration(context, String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.transparent, width: 3.0),
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 25,
    ),
    suffixIcon: Icon(Icons.remove_red_eye),
  );
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
String capitalizeFirstOfEach(String s) =>
    s.split(" ").map((str) => capitalize(str)).join(" ");

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(200, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
              children: <Widget>[
                new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text(
                          flag ? "Read More" : "Show Less",
                          style: new TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
