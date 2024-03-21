// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:greenearth/screens/HomeScreen/GoogleMap/camera.dart';
import 'package:greenearth/screens/exporter.dart';
import 'package:greenearth/process/exporter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Imported Files (end)

bool mapToggle = false;
Map<MarkerId, Marker> markers = <MarkerId, Marker> {};

class GoogleMapsSmall extends StatefulWidget {
  const GoogleMapsSmall({Key? key}) : super(key: key);

  @override
  State<GoogleMapsSmall> createState() => _GoogleMapsSmallState();
}

class _GoogleMapsSmallState extends State<GoogleMapsSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xffB4E197),
        // borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children:[
          Container(
            height: 80,
            width: 80,
            alignment: Alignment.center,
            child: Image.asset(
              "lib/assets/images/gif/map2.gif",
              height: 75,
              width: 75,
            ),
            decoration: BoxDecoration(
                color: const Color(0xffC4E497),
                borderRadius: BorderRadius.circular(15)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Map",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "show user & plantation locations",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleMapsContainer extends StatefulWidget {
  const GoogleMapsContainer({Key? key}) : super(key: key);

  @override
  State<GoogleMapsContainer> createState() => _GoogleMapsContainerState();
}

class _GoogleMapsContainerState extends State<GoogleMapsContainer> {

  @override
  void initState() {
    super.initState();
    getloc();
  }
  getloc() async{
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    lng = location.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: OpenContainer(
        transitionType: containerTransitionType,
        transitionDuration: const Duration(milliseconds: milSec),
        openBuilder: (context, _) => const GoogleMapsPage(),
        closedElevation: elevation,
        closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: col),
        closedBuilder: (context, _) => const GoogleMapsSmall(),
      ),
    );
  }
}

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  late GoogleMapController mapController;

  final LatLng _center = LatLng(lat, lng);

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  loadData() async{
    mapToggle = true;
    FirebaseFirestore.instance.collection('markers').get().then((markerLoc) {
      if(markerLoc.docs.isNotEmpty) {
        for (int i = 0; i < markerLoc.docs.length; i++) {
          initMarker(markerLoc.docs[i].data(), markerLoc.docs[i].id);
        }
      }
    });
  }


  void initMarker(specify, specifyId) async {
    final MarkerId markerId = MarkerId(specifyId);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(specify['location'].latitude, specify['location'].longitude),
      infoWindow: InfoWindow(title: specify['category'], snippet: specify['address']),
      icon: await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(12, 12)), 'lib/assets/images/png/leafMarker1.png'),
      onTap: (){
        // print(specify["clientName"]);
      },
    );
    setState(() {
      markers[markerId] = marker;
    });
  }
  @override
  void initState() {
    loadData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: mapToggle ?
                  GoogleMap(
                    onMapCreated: onMapCreated,
                    mapType: MapType.hybrid,
                    myLocationButtonEnabled: true,
                    compassEnabled: true,
                    myLocationEnabled: true,
                    minMaxZoomPreference: const MinMaxZoomPreference(7, 70),
                    initialCameraPosition: CameraPosition(target: LatLng(lat, lng), zoom: 17.0),
                    markers: Set<Marker>.of(markers.values),
                  ):
                  const Align(alignment: Alignment.center,child: Text('Loading...', style: TextStyle(fontSize: 30)),)
              ),
              const Positioned(
                  left: 10,
                  bottom: 35,
                  child: CameraSmall()),
            ],
          ),
        ],
      ),
    );
  }
}