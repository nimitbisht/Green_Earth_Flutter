// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:greenearth/screens/exporter.dart';
// Imported Files (end)


class PlantationSmall extends StatefulWidget {
  const PlantationSmall({Key? key}) : super(key: key);

  @override
  State<PlantationSmall> createState() => _PlantationSmallState();
}

class _PlantationSmallState extends State<PlantationSmall> {
  @override
  Widget build(BuildContext context) {
    return const Material(child: Center(child: Text('Add Plantation', style: TextStyle(fontSize: 30),),));
  }
}
class PlantationPage extends StatefulWidget {
  const PlantationPage({Key? key}) : super(key: key);

  @override
  State<PlantationPage> createState() => _PlantationPageState();
}

class _PlantationPageState extends State<PlantationPage> {
  @override
  Widget build(BuildContext context) {
    return const Material(child: Center(child: Text('Plantation', style: TextStyle(fontSize: 30),),));
  }
}

class PlantationContainer extends StatefulWidget {
  const PlantationContainer({Key? key}) : super(key: key);

  @override
  State<PlantationContainer> createState() => _PlantationContainerState();
}

class _PlantationContainerState extends State<PlantationContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: OpenContainer(
        transitionType: containerTransitionType,
        transitionDuration: const Duration(milliseconds: milSec),
        openBuilder: (context, _) => const PlantationPage(),
        closedElevation: elevation,
        closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: col),
        closedBuilder: (context, _) => const PlantationSmall(),
      ),
    );
  }
}
