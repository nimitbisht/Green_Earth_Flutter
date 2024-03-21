// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// Imported Files (start)

class FeedbackSmall extends StatelessWidget {
  const FeedbackSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'feedback',
      child: Material(
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
                  return const FeedbackPage();
                }
            )
            );
          },
          child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 37.0),
                // child: Text('Feedback', style: TextStyle(fontSize: 30),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.feedback_outlined,
                          //color: Colors.greenAccent,
                          size: 28.0,
                        ),
                      ),
                      TextSpan(
                        text: ' Feedback',
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

              )),
        ),
      ),
    );
  }
}
class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        height: 200,
        width: 370,
        child: Column(
          children: <Widget> [
            const Hero(
              tag: 'feedback',
              child: Material(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 17,
                        ),
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.feedback_outlined,
                              //color: Colors.greenAccent,
                              size: 28.0,
                            ),
                          ),
                          TextSpan(
                            text: '  Feedback',
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
                ),
              ),
            ),
            Material(
              child: SizedBox(
                height: 135,
                child: Center(
                  child: InkWell(
                      onTap: () async {
                        final Uri params = Uri(
                          scheme: 'mailto',
                          path: 'prabsudan777@gmail.com',
                        );
                        if (await canLaunchUrl(params)) {
                          await launchUrl(params);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red
                          ),
                        ),
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
