import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gratis/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.asset(
                  "assets/images/getStartedBg.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle("Best Deals"),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        right: 20.0,
                      ),
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.075),
                            offset: Offset(0, 10),
                            blurRadius: 15,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.asset(
                              "assets/images/getStartedBg.jpg",
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "The Amazon",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Text(
                                      "1 Room - 2 Adults",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 2.0,
                                    ),
                                    child: Text(
                                      "Jan 15 - 25",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                sectionTitle("Popular Destinations"),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        right: 20.0,
                      ),
                      width: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.075),
                            offset: Offset(0, 10),
                            blurRadius: 15,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            child: Image.asset(
                              "assets/images/getStartedBg.jpg",
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
        ),
      ),
    );
  }
}
