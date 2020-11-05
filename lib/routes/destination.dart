import 'package:flutter/material.dart';
import 'package:gratis/widgets.dart';
import 'package:gratis/database.dart';
import 'package:gratis/routes/reviews.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DestinationPage extends StatefulWidget {
  final String locationName;
  DestinationPage(this.locationName);
  @override
  _DestinationPageState createState() => _DestinationPageState(locationName);
}

class _DestinationPageState extends State<DestinationPage> {
  String locationName;
  _DestinationPageState(this.locationName);
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot destinationSnapshot;
  QuerySnapshot gallerySnapshot;
  QuerySnapshot reviewSnapshot;

  getDestinationGallery(locationName) async {
    print(locationName);
    databaseMethods.getLocationGallery(locationName).then((val) {
      print(val.toString());
      setState(() {
        gallerySnapshot = val;
        print(gallerySnapshot.toString());
      });
    });
  }

  getDestinationInfo(locationName) async {
    print(locationName);
    databaseMethods.getLocationTripInfo(locationName).then((val) {
      print(val.toString());
      setState(() {
        destinationSnapshot = val;
        print(destinationSnapshot.toString());
      });
    });
  }

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

  Widget loadDestinationBackdrop() {
    return destinationSnapshot != null
        ? CachedNetworkImage(
            imageUrl: destinationSnapshot.docs[0].data()["backdropPath"],
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        : Image.asset(
            "assets/images/destination.jpg",
            fit: BoxFit.cover,
          );
  }

  Widget loadDestinationInfo() {
    return destinationSnapshot != null
        ? Container(
            child: ListView.builder(
              itemCount: destinationSnapshot.docs.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String city =
                    capitalize(destinationSnapshot.docs[index].data()["city"]);
                String country = capitalize(
                    destinationSnapshot.docs[index].data()["country"]);
                return SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 5.0,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(capitalizeFirstOfEach(destinationSnapshot
                                .docs[index]
                                .data()["locationName"]) ??
                            "error"),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Text(
                            '$city, $country' ?? "error",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Divider(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: destinationTitle("Summary"),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: new DescriptionTextWidget(
                            text: destinationSnapshot.docs[index]
                                    .data()["summary"] ??
                                "error",
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            top: 10.0,
                            left: 20.0,
                            right: 20.0,
                            bottom: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                          child: Padding(
                            padding: const EdgeInsets.all(
                              15.0,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 20.0,
                                        ),
                                        child: Text(
                                          "4.5",
                                          style: TextStyle(
                                            fontSize: 36.0,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 3.0,
                                            ),
                                            child: Text("Total Score"),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 18,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 18,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 18,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 18,
                                              ),
                                              Icon(
                                                Icons.star_half,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Room",
                                          ),
                                          Text(
                                            "Service",
                                          ),
                                          Text(
                                            "Location",
                                          ),
                                          Text(
                                            "Price",
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 8.0,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.54,
                                        ),
                                        Container(
                                          height: 8.0,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.56,
                                        ),
                                        Container(
                                          height: 8.0,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.60,
                                        ),
                                        Container(
                                          height: 8.0,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.50,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        galleryImages(),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              destinationTitle("Reviews (15)"),
                              InkWell(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: Text(
                                    "View All",
                                    style: new TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReviewsPage(
                                          destinationSnapshot.docs[index]
                                              .data()["locationName"]),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        reviewsList(),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget reviewsList() {
    return reviewSnapshot != null
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1,
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

  Widget galleryImages() {
    return gallerySnapshot.docs.length != 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    destinationTitle("Photos"),
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text(
                          "View All",
                          style: new TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                height: 100,
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: gallerySnapshot.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100.0,
                        margin: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(gallerySnapshot
                                .docs[index]
                                .data()["galleryPath"]),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        : Container();
  }

  @override
  void initState() {
    getDestinationInfo(locationName);
    getDestinationGallery(locationName);
    getLocationReviews(locationName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFFFFFFF),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: <Widget>[
                IconButton(
                    icon: Container(
                      width: 32.0,
                      height: 32.0,
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
                    onPressed: () {}),
              ],
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: loadDestinationBackdrop(),
              ),
            ),
          ];
        },
        body: loadDestinationInfo(),
      ),
    );
  }
}

Widget destinationTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
  );
}

Material destinationGallery(context, String galleryImagePath) {
  return Material(
    color: Colors.white,
    child: Container(
      width: 100.0,
      margin: const EdgeInsets.only(
        left: 20.0,
      ),
      child: PhotoView(
        imageProvider: AssetImage("assets/images/destination.jpg"),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/destination.jpg"),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  );
}
