import 'package:flutter/material.dart';
import 'package:gratis/widgets.dart';
import 'package:gratis/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatefulWidget {
  final String userFullName;
  ProfilePage(this.userFullName);
  @override
  _ProfilePageState createState() => _ProfilePageState(userFullName);
}

class _ProfilePageState extends State<ProfilePage> {
  final String userFullName;
  _ProfilePageState(this.userFullName);
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot userSnapshot;
  QuerySnapshot reviewSnapshot;

  getLocationReviews(locationName) async {
    print(locationName);
    databaseMethods.getLocationReviews(locationName).then((val) {
      print(val.toString());
      setState(() {
        userSnapshot = val;
        print(userSnapshot.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget reviewsList() {
    return reviewSnapshot != null
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: reviewSnapshot.docs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return reviewItem(
                reviewUser: reviewSnapshot.docs[index].data()["reviewUser"],
                reviewBody: reviewSnapshot.docs[index].data()["reviewBody"],
              );
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

  Widget reviewItem({String reviewUser, String reviewBody}) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        bottom: 20.0,
        right: 20.0,
      ),
      child: Column(
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          margin: const EdgeInsets.only(
                            right: 15.0,
                          ),
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new CachedNetworkImageProvider(
                                  "https://i.imgur.com/iQkzaTO.jpg"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reviewUser,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Posted November 1, 2020",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 3.0,
                          ),
                          child: Text("Rating"),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                              size: 18,
                            ),
                            Icon(
                              Icons.star_half,
                              color: Theme.of(context).primaryColor,
                              size: 18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        reviewBody,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: reviewsList(),
        ),
      ),
    );
  }
}
