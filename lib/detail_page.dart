// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.planet}) : super(key: key);

  final Planets planet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 32.0, right: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.0,
                    ),
                    Text(
                      planet.planetName,
                      style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Solar System',
                      style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      planet.description,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: contentTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 32.0),
                height: 150.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: planet.planetImages.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5.0,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CachedNetworkImage(
                            imageUrl: planet.planetImages[index],
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
            ]),
          ),
          Positioned(
              right: -100.0,
              top: -0.0,
              child: Hero(
                  tag: planet.planetNumber, child: Image.asset(planet.image))),
          Positioned(
              left: 30.0,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back))),
          Positioned(
              top: 40.0,
              left: 50.0,
              child: Text(
                planet.planetNumber.toString(),
                style: TextStyle(
                  fontSize: 200.0,
                  color: primaryTextColor.withOpacity(0.3),
                ),
              )),
        ],
      )),
    );
  }
}
