import 'package:flutter/material.dart';


//constants.dart
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 90.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);




class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700], //background color of scaffold
      appBar: AppBar(
        title:const Text("AQI TABLE"), //title of app
        backgroundColor: Colors.redAccent, //background color of app bar
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/png/pol3.png'),
            //fit: BoxFit.fill,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[


              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context, cityName);
                },


                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(100),
                    1: FlexColumnWidth(),
                  },
                  border: TableBorder.all(color: Colors.black45, width: 1),
                  children: [
                    TableRow(children: [
                      Text(
                        '    PM 2.5',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '    Description',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        ' 0-12',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        ' Good',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        ' 12-35',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        ' Moderate ',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        ' 35-55',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        ' Unhealthy for\n sensitive Groups',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        ' 55-150',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        ' Unhealthy ',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        ' 150-250  ',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        ' Very Unhealthy ',
                        style: TextStyle(fontSize: 25),
                      ),

                    ]),
                    TableRow(children: [
                      Text(
                        ' 250+',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        ' Hazardous',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
