// Imported Files (start)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:greenearth/process/exporter.dart';
import 'package:greenearth/screens/exporter.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Imported Files (end)

var pending;
var approved;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime timeBackPressed = DateTime.now();
  @override
  void initState() {
    super.initState();
    pendingRequest();
    approvedRequest();
  }

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () async {
          final difference =DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= Duration(seconds: 2);

          timeBackPressed = DateTime.now();

          if (isExitWarning){
            const message = 'Press back again to exit';
            Fluttertoast.showToast(msg: message,fontSize: 18);


            return false;
          }else{
            Fluttertoast.cancel();
            return true;
          }

        },

        child: Scaffold(
          // backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              // backgroundColor: Colors.white, // status bar color
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      // fit: BoxFit.fitWidth,
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "lib/assets/images/png/clim4.png"))),
              ),



              title:const Text.rich(
                TextSpan(
                  style: TextStyle(
                    // fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: 'G',
                      style: TextStyle(
                        fontSize: 40,
                        // fontFamily: 'Spartan MB',
                        // fontFamily: 'Quicksand',
                        // color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // WidgetSpan(
                    //   child: Icon(Icons.info),
                    // ),
                    TextSpan(
                      text: 'REEN EARTH',
                      style: TextStyle(
                        fontSize: 33,
                        fontFamily: 'Quicksand',
                        // fontFamily: 'Spartan MB',
                        // color: Colors.green,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ), //title of app
              // backgroundColor: Colors.redAccent, //background color of app bar
            ),



            body:
            Container(     decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/png/home2.png'),
                //fit: BoxFit.fill,
              ),
            ),
              child: PageView(
                scrollDirection: Axis.vertical,
                children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[  ////--wid



                      Container(
                        height: 180,
                        width: double.infinity,

                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              alignment: Alignment.centerRight,
                              image: AssetImage("lib/assets/images/gif/log7.gif"),
                            )),
                        padding: const EdgeInsets.all(12.0),
                        margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 32.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  const [
                              Text(
                                "Initiative toward \na greener and \ncleaner Earth!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),




                            ]),
                      ),


                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 7.0),
                        child: Text(
                          " Category ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                      const Page1(),
                    ],
                  ),
                  const MyDrawer(),
                ],
              ),
            )


        ),
      );

  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10,),
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: const [
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 0.8,
            child: WeatherAqiContainer(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 0.8,
            child: GoogleMapsContainer(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 0.8,
            child: InformationContainer(),
          ),
        ],
      ),
    );
  }
}

pendingRequest() async {
  FirebaseFirestore.instance.collection('requestMark').where('userId', isEqualTo: userEmail).get().then((pen){
    if(pen.docs.isNotEmpty){
      pending = pen.docs.length;
    }else{
      pending = 0;
    }
  }
  );
}
approvedRequest() async {
  FirebaseFirestore.instance.collection('markers').where('userId', isEqualTo: userEmail).get().then((pen){
    if(pen.docs.isNotEmpty){
      approved = pen.docs.length;
    }else{
      approved = 0;
    }
  }
  );
}