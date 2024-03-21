// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Imported Files (start)

class ThemeSmall extends StatefulWidget {
  const ThemeSmall({Key? key}) : super(key: key);


  @override
  State<ThemeSmall> createState() => _ThemeSmallState();
}

class _ThemeSmallState extends State<ThemeSmall> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // const Text('Theme', style: TextStyle(fontSize: 30)),
              const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.wb_incandescent_outlined,
                        //     color: Colors.yellow,
                        size: 28.0,),
                    ),
                    TextSpan(
                      text: ' Theme',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Quicksand',
                        //  color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),


              Switch(
                  activeColor: Colors.lightGreen,
                  activeTrackColor: Colors.white60,
                  value: Provider.of<ThemeState>(context).theme ==
                      ThemeType.DARK,
                  onChanged: (value) {
                    Provider.of<ThemeState>(context, listen: false).theme =
                    value ? ThemeType.DARK : ThemeType.LIGHT;
                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
    );
  }
}


// ignore: constant_identifier_names
enum ThemeType { DARK, LIGHT }

class ThemeState extends ChangeNotifier {
  bool isDarkTheme = false;

  ThemeState() {
    getTheme().then((type) {
      isDarkTheme = type == ThemeType.DARK;
      notifyListeners();
    });
  }
  ThemeType get theme => isDarkTheme ? ThemeType.DARK : ThemeType.LIGHT;
  set theme(ThemeType type) => setTheme(type);

  void setTheme(ThemeType type) async {
    isDarkTheme = type == ThemeType.DARK;
    notifyListeners();
  }

  Future<ThemeType> getTheme() async {
    return isDarkTheme ? ThemeType.DARK : ThemeType.LIGHT;
  }
}