import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:globalui/constants_color.dart';
import 'package:globalui/model/planet_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradientStartColor,gradientEndColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3,0.6],
          )
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontSize: 44,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.spaceAround,
                      children: [
                        Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            color: const Color(0x7cdbf1ff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        // DropdownButton(
                        //   items: [
                        //     DropdownMenuItem(
                        //       child: Text(
                        //         'Solar System',
                        //         style: TextStyle(
                        //           fontFamily: 'Avenir',
                        //           fontSize: 24,
                        //           color: const Color(0x7cdbf1ff),
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //         textAlign: TextAlign.left,
                        //       ),
                        //     ),
                        //   ],
                        //   onChanged: (value) {},
                        //   icon: Padding(
                        //       padding: EdgeInsets.only(left: 16.0),
                        //       child: Icon(
                        //         Icons.arrow_drop_down,
                        //         color: Colors.white,
                        //       )),
                        //   underline: SizedBox(),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              // Card
              Container(
                height: 500,
                padding: EdgeInsets.only(left: 32 ),
                child: Swiper(
                  // swiper file
                  //sperate file of data
                  itemCount: planetsList.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      size:3,
                      activeSize: 8,
                      activeColor: Colors.orange,
                      space: 2,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding:EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      planetsList[index].name,
                                      style: TextStyle(
                                        fontFamily: "Avenir",
                                        fontSize: 40,
                                        color: Color(0xff47455f),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Solar System",
                                      style: TextStyle(
                                        fontFamily: "Avenir",
                                        fontSize: 23,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 32,),
                                    Row(
                                      children: [
                                        Text(
                                          "Read More",
                                          style: TextStyle(
                                            fontFamily: "Avenir",
                                            fontSize: 18,
                                            color: Color(0xffe4979e),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: secondaryTextColor,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(planetsList[index].iconImage),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      // Naviagtrion menu

      bottomNavigationBar:Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
          color: navigationColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Image.asset("assets/menu_icon.png"), onPressed: (){}),
            IconButton(icon: Image.asset("assets/search_icon.png"), onPressed: (){}),
            IconButton(icon: Image.asset("assets/profile_icon.png"), onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
