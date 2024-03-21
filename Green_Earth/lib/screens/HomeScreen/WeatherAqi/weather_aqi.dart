// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:greenearth/process/WeatherAqiProcess/screens/loading_screen.dart';
import 'package:greenearth/screens/exporter.dart';
// Imported Files (end)


class WeatherAqiSmall extends StatefulWidget {
  const WeatherAqiSmall({Key? key}) : super(key: key);

  @override
  State<WeatherAqiSmall> createState() => _WeatherAqiSmallState();
}

class _WeatherAqiSmallState extends State<WeatherAqiSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Color(0xff40DFEF),
        // borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children:[
          Container(
            height: 80,
            width: 80,
            alignment: Alignment.center,
            child: Image.asset(
              "lib/assets/images/gif/wet2.gif",
              height: 75,
              width: 75,
            ),
            decoration: BoxDecoration(
                color: Color(0xff40DFE4),
                borderRadius: BorderRadius.circular(15)
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Weather & AQI",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Display recent Weather & AQI data ",
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

class WeatherAqiContainer extends StatefulWidget {
  const WeatherAqiContainer({Key? key}) : super(key: key);

  @override
  State<WeatherAqiContainer> createState() => _WeatherAqiContainerState();
}

class _WeatherAqiContainerState extends State<WeatherAqiContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: OpenContainer(
        transitionType: containerTransitionType,
        transitionDuration: const Duration(milliseconds: milSec),
        openBuilder: (context, _) => const WeatherAqiPage(),
        closedElevation: elevation,
        closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: col),
        closedBuilder: (context, _) => const WeatherAqiSmall(),
      ),
    );
  }
}


class WeatherAqiPage extends StatefulWidget {
  const WeatherAqiPage({Key? key}) : super(key: key);

  @override
  State<WeatherAqiPage> createState() => _WeatherAqiPageState();
}

class _WeatherAqiPageState extends State<WeatherAqiPage> {
  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}
