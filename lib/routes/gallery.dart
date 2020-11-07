import 'package:flutter/material.dart';
import 'package:gratis/widgets.dart';
import 'package:gratis/database.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryPage extends StatefulWidget {
  final String locationName;
  GalleryPage(this.locationName);
  @override
  _GalleryPageState createState() => _GalleryPageState(locationName);
}

class _GalleryPageState extends State<GalleryPage> {
  final String locationName;
  _GalleryPageState(this.locationName);
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot gallerySnapshot;

  getGalleryImages(locationName) async {
    print(locationName);
    databaseMethods.getGalleryImages(locationName).then((val) {
      print(val.toString());
      setState(() {
        gallerySnapshot = val;
        print(gallerySnapshot.toString());
      });
    });
  }

  @override
  void initState() {
    getGalleryImages(locationName);
    super.initState();
  }

  Widget reviewsList() {
    return gallerySnapshot != null
        ? Container(
            margin: const EdgeInsets.only(
              right: 20.0,
            ),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: gallerySnapshot.docs.length,
              shrinkWrap: true,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return reviewItem(
                  galleryLocation:
                      gallerySnapshot.docs[index].data()["galleryLocation"],
                  galleryPath:
                      gallerySnapshot.docs[index].data()["galleryPath"],
                );
              },
            ),
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

  Widget reviewItem({String galleryLocation, String galleryPath}) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(galleryPath),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
