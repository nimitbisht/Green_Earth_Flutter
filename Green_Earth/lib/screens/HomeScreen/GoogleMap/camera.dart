// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greenearth/process/exporter.dart';
import 'package:greenearth/screens/HomeScreen/Profile/Settings/exporter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

var imageUrl;

class CameraSmall extends StatefulWidget {
  const CameraSmall({Key? key}) : super(key: key);

  @override
  State<CameraSmall> createState() => _CameraSmallState();
}

class _CameraSmallState extends State<CameraSmall> {


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              barrierDismissible: true,
              fullscreenDialog: false,
              barrierColor: Colors.black54,
              maintainState: true,
              transitionDuration: const Duration(milliseconds: 700),
              reverseTransitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation) {
                return const CameraPage();
              }
          )
          );
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: const Icon(Icons.add, color: Colors.white,size: 40,),
        ),
      ),
    );
  }
}

File? image;
XFile? pickedImage;
TextEditingController imageAddress = TextEditingController();

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ImagePicker _picker = ImagePicker();

  int i = 4;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          width: 320,
          height: 500,
          child: Material(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: () async {
                      pickedImage = await _picker.pickImage(source: ImageSource.camera);
                      // XFile? video=  await _picker.pickVideo(source: ImageSource.gallery);
                      setState(() {
                        image = File(pickedImage!.path);
                      });
                    },
                      child: const Text('Camera', style: TextStyle(fontSize: 30),),),
                  ),
                ),

                Flexible(
                  flex: i,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                    ),
                    width: 250,
                    height: 300,
                    child: image == null
                        ? const Center(child: Text("Your Image", style: TextStyle(fontSize: 30),))
                        : Image.file(
                      image!,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: logicalWidth - 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: imageAddress,
                          style: const TextStyle(fontSize: 25),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          onTap: (){i = 2;},
                          onEditingComplete: (){
                            i = 4;
                            FocusScope.of(context).unfocus();
                            },
                          maxLength: 50,
                        ),
                      ),
                    ),
                  ),
                ),

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      requestAdmin();
                      setState(() {
                        // imageAddress.text = '';
                        image = null;
                      });
                    },
                      child: const Text('Upload', style: TextStyle(fontSize: 30),),),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

requestAdmin() async {
  if(pickedImage == null) return;
  if(imageAddress.text == '') return;
  DateTime timeStamp = DateTime.now();
  final requestDoc = FirebaseFirestore.instance.collection('requestMark').doc();
  await uploadImage(requestDoc.id);
  final userRequest = {
    'location' : GeoPoint(lat, lng),
    'address' : imageAddress.text,
    'imagePath': requestDoc.id,
    'userId' : userEmail,
    'timeStamp' : timeStamp,
    'imageUrl': imageUrl,
  };
  await requestDoc.set(userRequest);
  imageAddress.text = '';
}

uploadImage(String imgPath) async {
  final _firebaseStorage = FirebaseStorage.instance;
  if (pickedImage != null){
    //Upload to Firebase
    if(imageAddress.text == '') return;
    await _firebaseStorage
        .ref()
        .child('requestImages/$imgPath')
        .putFile(image!);
    imageUrl = await FirebaseStorage.instance.ref().child('requestImages/$imgPath').getDownloadURL();
  }
}
