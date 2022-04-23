// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'detail_page.dart';
import 'model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.3,
                0.7
              ],
                  colors: [
                gradientContainerStartColor,
                gradientContainerEndColor
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 35),
                child: Column(children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                        fontSize: 55.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  DropdownButton(
                      items: <DropdownMenuItem<Widget>>[
                        DropdownMenuItem(
                            child: Text(
                          'Solar System',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 27,
                            color: const Color(0x7cdbf1ff),
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                      ],
                      icon: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      onChanged: (value) {}),
                ]),
              ),
              Container(
                height: 400,
                padding: EdgeInsets.only(left: 32.0),
                child: Swiper(
                  itemCount: planetsList.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, items) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  DetailPage(planet: planetsList[items])),
                        );
                      },
                      child: Stack(
                        children: [
                          Column(children: [
                            SizedBox(
                              height: 100.0,
                            ),
                            Card(
                              elevation: 6.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 28.0, bottom: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 100),
                                    Text(
                                      planetsList[items].planetName,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 44,
                                        color: const Color(0xff47455f),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      'Solar System',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 23,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 32),
                                    Row(children: <Widget>[
                                      Text(
                                        'Know more',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 18,
                                          color: secondaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: secondaryTextColor,
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                          Hero(
                              tag: planetsList[items].planetNumber,
                              child: Image.asset(planetsList[items].image)),
                          Positioned(
                              right: 15,
                              bottom: 55,
                              child: Text(
                                planetsList[items].planetNumber.toString(),
                                style: TextStyle(
                                  fontSize: 160,
                                  color: primaryTextColor.withOpacity(0.3),
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(32.0)),
                        color: navigationColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/menu_icon.png')),
                              Text(
                                'Explore',
                                style: TextStyle(
                                  color: titleTextColor.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/search_icon.png')),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/profile_icon.png')),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
