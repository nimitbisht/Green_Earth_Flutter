// Imported Files (start)
import 'package:flutter/material.dart';
import 'package:greenearth/process/exporter.dart';
// Imported Files (start)



class AccountSmall extends StatefulWidget {
  const AccountSmall({Key? key}) : super(key: key);

  @override
  State<AccountSmall> createState() => _AccountSmallState();
}

class _AccountSmallState extends State<AccountSmall> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'account',
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
                  return const AccountPage();
                }
            )
            );
          },
          child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                // child: Text('Account', style: TextStyle(fontSize: 30),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.supervised_user_circle_outlined,
                          //color: Colors.greenAccent,
                          size: 28.0,
                        ),
                      ),
                      TextSpan(
                        text: ' Account    ',
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

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _bio = TextEditingController();
    return Center(
      child: Hero(
        tag: 'account',
        child: Container(
          width: 320,
          height: 500,
          color: Colors.white,
          child: Material(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.00),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: (){},
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 17

                                  ),
                                ),
                              ),
                            ),
                          )
                      ),

                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: (){},
                                child: const Text(
                                  'Done',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(backgroundImage: NetworkImage(userPhoto), radius: 70,),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(userName, style: TextStyle(fontSize: 30),),
                  ),
                ),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Align(alignment: Alignment.bottomLeft ,child: Text('Bio',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: _bio,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Hi, I am $userName ',
                        ),
                        maxLength: 70,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ----------------------------------------------------------------

// As example only
// Scaffold(
// body: Align(
// alignment: Alignment.centerRight,
// child: SizedBox(
// height: 400,
// width: 250,
// child: Column(
// children: <Widget>[
// const Flexible(child: AccountSmall()),
// const Flexible(child: FeedbackSmall()),
// Flexible(child: AboutSmallPage()),
// Flexible(child: Container(color: Colors.black12,)),
// Flexible(child: Container(color: Colors.grey,)),
//
// ],
// ),
// ),
// ),