// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenearth/process/exporter.dart';
import 'package:greenearth/screens/HomeScreen/Profile/Settings/exporter.dart';
import 'package:greenearth/screens/exporter.dart';
// Imported Files (end)

const icon = FontAwesomeIcons.gear;

// ClosedContainer for Profile (start)
class ProfileSmall extends StatefulWidget {
  const ProfileSmall({Key? key}) : super(key: key);

  @override
  State<ProfileSmall> createState() => _ProfileSmallState();
}

class _ProfileSmallState extends State<ProfileSmall> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(onTap: (){
        Navigator.of(context).push(createRoute());
      },
          child: Container(alignment: Alignment.topCenter,child: CircleAvatar(radius: 35, backgroundImage: NetworkImage(userPhoto),))),
    );
  }
}
// ClosedContainer for Profile (end)

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MyDrawer(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      const curve = Curves.fastOutSlowIn;
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

// Profile Screen (start)
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Column(
          children: const <Widget>[
            ProfileData(),
          ],
        ),
      ),
    );
  }
}
// Profile Screen (end)
class ProfileData extends StatefulWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 10,
                    child: SizedBox(
                      height: logicalHeight / 3.5,
                      width: logicalWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0,),
                        child: ListTile(
                          horizontalTitleGap: 0.0,
                          leading: CircleAvatar(radius: 40, backgroundImage: NetworkImage(userPhoto), ),
                          title: Text(userName, style: const TextStyle(fontSize: 35),),
                          subtitle: Text(userEmail, style: const TextStyle(fontSize: 19, color: Colors.red),),
                  ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 10,
                    child: SizedBox(
                      height: logicalHeight / 7,
                      width: logicalWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0,),
                        child: Center(child: Text('Pending Requests : ${pending.toString()}', style: const TextStyle(fontSize: 25),)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 10,
                    child: SizedBox(
                      height: logicalHeight / 7,
                      width: logicalWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0,),
                        child: Center(child: Text('Approved Requests : ${approved.toString()}', style: const TextStyle(fontSize: 25))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 120,),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                          onTap: (){
                            drawerController.toggle!();
                          },
                          child: const Icon(icon, size: 35,))),
                ],
              ),
          ),
    );
  }
}


// Flutter_Zoom_Drawer Class (start)
class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: drawerController,
        style: DrawerStyle.defaultStyle,
        menuScreen: const Settings(),
        mainScreen: const ProfilePage(),
        borderRadius: 20.0,
        showShadow: true,

        //menuBackgroundColor: const Color(0xff1F3B2F),
        //drawerShadowsBackgroundColor: Color(0xff9CA58AFF),

        angle: 0.0,
        isRtl: true,
        slideWidth: logicalWidth * 0.77,
        openCurve: Curves.easeIn,
        closeCurve: Curves.easeIn,
      ),
    );
  }
}
// Flutter_Zoom_Drawer Class (end)
