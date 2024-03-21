// Imported Files (start)
import 'package:flutter/material.dart';
// Imported Files (start)


class AboutSmallPage extends StatelessWidget {
  const AboutSmallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          showAboutDialog(
            context: context,
            applicationIcon: const FlutterLogo(),
            applicationLegalese: 'An initiative to improve our environment.',
            applicationName: 'Green Earth',
            applicationVersion: '0.0.2',
          );
        },
        child: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.document_scanner_outlined,
                        //color: Colors.greenAccent,
                        size: 28.0,
                      ),
                    ),
                    TextSpan(
                      text: ' More info...',
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
    );
  }
}
