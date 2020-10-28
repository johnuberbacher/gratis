import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gratis/widgets.dart';
import 'package:gratis/database.dart';

DocumentSnapshot snapshot;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot locationSnapshot;

  getLocations() async {
    databaseMethods.getAllLocations().then((val) {
      print(val.toString());
      setState(() {
        locationSnapshot = val;
        print(locationSnapshot);
      });
    });
  }

  Widget locationList() {
    return locationSnapshot != null
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: locationSnapshot.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return locationCard(
                  locationName: locationSnapshot.docs[index].data()["name"],
                  locationBackdropImagePath:
                      locationSnapshot.docs[index].data()["backdropPath"]);
            },
          )
        : Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                ),
                child: CircularProgressIndicator(),
              ),
            ),
          );
  }

  Widget destinationList() {
    return locationSnapshot != null
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: locationSnapshot.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return destinationCard(
                  locationName: locationSnapshot.docs[index].data()["name"],
                  locationBackdropImagePath:
                      locationSnapshot.docs[index].data()["backdropPath"]);
            },
          )
        : Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                ),
                child: CircularProgressIndicator(),
              ),
            ),
          );
  }

  Widget locationCard({String locationName, String locationBackdropImagePath}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        right: 0.0,
        bottom: 20.0,
        left: 20.0,
      ),
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(locationBackdropImagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
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
                    locationName,
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
    );
  }

  Widget destinationCard(
      {String locationName, String locationBackdropImagePath}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        right: 0.0,
        bottom: 20.0,
        left: 20.0,
      ),
      width: MediaQuery.of(context).size.width * 0.66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(locationBackdropImagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black87.withOpacity(0.33), BlendMode.darken),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  bottom: 20.0,
                ),
                child: Text(
                  locationName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    getLocations();
  }

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
                background: Container(
                  child: Image.asset(
                    "assets/images/getStartedBg.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              top: 20.0,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle("Best Deals"),
                Container(
                  height: 235,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      locationList(),
                    ],
                  ),
                ),
                sectionTitle("Popular Destinations"),
                Container(
                  height: 200,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      destinationList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
