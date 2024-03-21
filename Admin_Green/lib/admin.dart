import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

var pixelRatio = window.devicePixelRatio;
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalHeight = logicalScreenSize.height;
var logicalWidth = logicalScreenSize.width;
// ignore: prefer_typing_uninitialized_variables
var url;

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  @override
  Widget build(BuildContext context) {
    Stream<List<User>> readUser() =>
        FirebaseFirestore.instance.collection('requestMark').orderBy('timeStamp', descending: false)
            .snapshots()
            .map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

    return
      Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/wall5.jpg"),
                fit: BoxFit.fill)),

        child: Scaffold(
          backgroundColor: Colors.transparent,

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
                          "lib/assets/w22.jpg"))),
            ),

            title:const Text.rich(
              TextSpan(
                style: TextStyle(
                ),
                children: [
                  WidgetSpan(
                    child: Icon(Icons.public ,
                      color: Colors.green,
                      size: 39.0,
                    ),


                  ),
                  TextSpan(
                    text: ' ADMIN PANEL',
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

          body: StreamBuilder<List<User>>(
            stream: readUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final users = snapshot.data!;
                return ListView(
                  children: users.map(userRequest).toList(),
                );
              } else {
                return const Center(child: Text('Loading...', style: TextStyle(fontSize: 30),
                ));
              }
            },
          ),
        ),
      );
  }
}

imageData(String imgPath) async {
  final FirebaseStorage storage = FirebaseStorage.instance;
  url = await storage
      .ref('requestImages/$imgPath')
      .getDownloadURL();
}

class User {
  final String address;
  final String imagePath;
  final GeoPoint location;
  final DateTime timeStamp;
  final String userId;
  final dynamic imageUrl;

  User({
    required this.address,
    required this.imagePath,
    required this.location,
    required this.timeStamp,
    required this.userId,
    required this.imageUrl,
  });

  static User fromJson(Map<String, dynamic> json) => User(
      address: json['address'],
      imagePath: json['imagePath'],
      location: json['location'],
      timeStamp: (json['timeStamp'] as Timestamp).toDate(),
      userId: json['userId'],
      imageUrl: json['imageUrl']
  );
}

Widget userRequest(User user) {
  imageData(user.imagePath);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
    child: Column(
      children: [
        Container(
          height: logicalHeight / 3,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              SizedBox(
                  width: logicalWidth / 2.8,
                  child: InkWell(
                    onTap: (){},
                    child: Material(
                      child: Image(
                        image: NetworkImage(user.imageUrl),
                        height: logicalHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                          child: Text(
                            'Address: \n ${user.address}',
                            style: const TextStyle(fontSize: 17),
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                          child: Text(
                            'Location: \n ${user.location.latitude}, ${user.location.longitude}',
                            style: const TextStyle(fontSize: 17),
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                          child: Text(
                            'TimeStamp: \n ${user.timeStamp}',
                            style: const TextStyle(fontSize: 17),
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                          child: Text(
                            'UserId: \n ${user.userId}',
                            style: const TextStyle(fontSize: 17),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: Row(
            crossAxisAlignment:  CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: (){add(user);},
                  child: const Text('Accept'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(
                        fontSize: 25,
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: (){remove(user, 0);},
                  child: const Text('Decline'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle: const TextStyle(
                        fontSize: 25,
                      )
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

add(User user) async {
  final json = {
    'address': user.address,
    'category': 'Plantation',
    'imagePath': user.imagePath,
    'imageUrl': user.imageUrl,
    'location': user.location,
    'timeStamp': user.timeStamp,
    'userId': user.userId,
  };
  final userDocStore = FirebaseFirestore.instance.collection('markers').doc(user.imagePath);
  await userDocStore.set(json);
  remove(user, 1);
}

remove(User user, int num) {
  final userDoc = FirebaseFirestore.instance.collection('requestMark').doc(user.imagePath);
  userDoc.delete();
  if(num == 0) {
    final requestFireImage = FirebaseStorage.instance.refFromURL(user.imageUrl);
    requestFireImage.delete();
  }
}
