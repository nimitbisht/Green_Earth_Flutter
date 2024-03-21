import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {


AnimationController animationController;
Animation colorsTween, homeTween, yTween, iconTween,drawerTween;
Function()? onPressed;

CustomAppBar({Key? key,
  required this.animationController,
required this.colorsTween,
required this.drawerTween,
required this.homeTween,
required this.iconTween,
required this.onPressed,
required this.yTween
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context,child)=>AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.insert_chart_outlined_sharp ,
                size: 30.0,
                color: drawerTween.value,
              ),
              onPressed: onPressed,
            ),
          backgroundColor: colorsTween.value,
          elevation: 0,
          title: Row(
            children: [
              Text("Information " , style: TextStyle(
                color: homeTween.value,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              Text("Earth", style: TextStyle(
                  color: yTween.value,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),)
            ],
          ),

        ),
      ),
    );
  }
}
