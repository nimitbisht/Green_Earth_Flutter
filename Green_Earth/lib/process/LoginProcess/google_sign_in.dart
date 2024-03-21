// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greenearth/process/exporter.dart';
import 'package:greenearth/screens/HomeScreen/Profile/Settings/exporter.dart';
import 'package:greenearth/screens/exporter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
// Imported Files (end)

late AnimationController _coffeeController;

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}


class _AuthenticationState extends State<Authentication> with TickerProviderStateMixin{

  bool copAnimated = false;
  bool animateCafeText = false;

   @override
  void initState() {
    googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        currentUser = account;
      });
    });
      super.initState();
      _coffeeController = AnimationController(vsync: this, duration: const Duration(seconds: 0));
      _coffeeController.addListener(() {
        if (_coffeeController.value > 0.8) {
          copAnimated = true;
          setState(() {});
          Future.delayed(const Duration(seconds: 1), () {
            animateCafeText = true;
          });
        }
      });
      googleSignIn.signInSilently();
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) =>
  Scaffold(
    body: authBody(),
  );
Widget authBody() {
  GoogleSignInAccount? user = currentUser;
  if(user != null){
    userPhoto = user.photoUrl;
    userName = user.displayName;
    userEmail = user.email;
    createUser(email: userEmail, name: userName);
    return const HomeScreen();
  } else {
    var screenHeight = logicalHeight;
    return Scaffold(
      backgroundColor: Colors.green.shade500,
      body: Stack(
        children: [
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: copAnimated ? screenHeight / 1.9 : screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(copAnimated ? 40.0 : 0.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !copAnimated,
                  child: Lottie.asset(
                    'lib/assets/other_assets/json/plant.json',
                    controller: _coffeeController,
                    onLoaded: (composition) {
                      _coffeeController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: copAnimated,
                  child: Image.asset(
                    'lib/assets/images/gif/log9.gif',
                    height: 270.0,
                    //width: 190.0,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateCafeText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      'Green Earth',
                      style: TextStyle(fontSize: 65.0, color: Colors.green, fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Authentication',
                    style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                        color: Colors.white),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    'This is our initiative to bring a change, are you willing to put in the efforts? ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white.withOpacity(1),
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 85.0,
                      width: 355.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.0),
                      ),
                      child: const IconButton(
                        onPressed: signIn,
                        icon: Icon(FontAwesomeIcons.google, color: Colors.white, size: 32,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          )
          ),
        ],
      ),
    );
  }
}

}

void signOut(){
  googleSignIn.disconnect();
}

Future<void> signIn() async {
      await googleSignIn.signIn();

}

Future createUser({required String email, required String name}) async{
  final docUser = FirebaseFirestore.instance.collection('users').doc(email);

  final json = {
    'name' : name,
    'email': email,
  };

  await docUser.set(json);
}