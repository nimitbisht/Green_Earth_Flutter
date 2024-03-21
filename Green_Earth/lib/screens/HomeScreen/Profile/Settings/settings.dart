// Imported Files (start)
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:greenearth/process/exporter.dart';
import 'package:greenearth/screens/HomeScreen/Profile/Settings/exporter.dart';
// Imported Files (end)


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 70,
          ),
          const Text('Settings', style: TextStyle(fontSize: 50,
            // color: Colors.white,
          ),),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 70,),
                const Flexible(fit: FlexFit.loose, child: AccountSmall()),
                const Flexible(fit: FlexFit.loose, child: ThemeSmall()),
                const Flexible(fit: FlexFit.loose, child: FeedbackSmall()),
                const Flexible(fit: FlexFit.loose, child: AboutSmallPage()),
                Flexible(fit: FlexFit.loose, child: permissionsOption()),
                const SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: SizedBox(
                    width: logicalWidth,
                    height: logicalHeight / 11,
                    child:Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                        child: InkWell(
                          onTap: (){
                            signOut();
                          },
                          // child: const Text('Logout', style: TextStyle(fontSize: 30),
                          //   ),
                          child: const Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.logout,
                                    // color: Colors.greenAccent,
                                    size: 28.0,
                                    semanticLabel: 'Text to announce in accessibility modes',
                                  ),
                                ),

                                TextSpan(
                                  text: '  LOGOUT',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Quicksand',
                                    //  color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                      ),
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
}

Widget permissionsOption() {
  return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        // child: Text('Account', style: TextStyle(fontSize: 30),
        child: InkWell(
          onTap: (){
            AppSettings.openAppSettings();
          },
          child: const Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 17,
              ),
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.security,
                    //color: Colors.greenAccent,
                    size: 28.0,
                  ),
                ),
                TextSpan(
                  text: ' Permissions',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Quicksand',
                    // color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),

              ],
            ),
          ),
        ),
      )
  );
}