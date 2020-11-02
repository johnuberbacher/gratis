import 'package:flutter/material.dart';
import 'package:gratis/widgets.dart';
import 'package:gratis/database.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ReviewsPage extends StatefulWidget {
  final String locationName;
  ReviewsPage(this.locationName);
  @override
  _ReviewsPageState createState() => _ReviewsPageState(locationName);
}

class _ReviewsPageState extends State<ReviewsPage> {
  final String locationName;
  _ReviewsPageState(this.locationName);
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot reviewSnapshot;

  getLocationReviews(locationName) async {
    print(locationName);
    databaseMethods.getLocationReviews(locationName).then((val) {
      print(val.toString());
      setState(() {
        reviewSnapshot = val;
        print(reviewSnapshot.toString());
      });
    });
  }

  @override
  void initState() {
    getLocationReviews(locationName);
    super.initState();
  }

  Widget reviewsList() {
    return reviewSnapshot != null
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: reviewSnapshot.docs.length,
            shrinkWrap: true,
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
                              image: new NetworkImage(
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
                        "Quis vel eros donec ac odio. At quis risus sed vulputate odio ut enim blandit. Morbi quis commodo odio aenean.",
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
