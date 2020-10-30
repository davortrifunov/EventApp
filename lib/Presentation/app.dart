import 'package:EventApp/Database/models/db_service.dart';
import 'package:EventApp/Database/models/event.dart';
import 'package:EventApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var mySelectedPosition = 0;
  void _onItemTapped(int index) {
    setState(() {
      mySelectedPosition = index;
    });
  }

  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> pages = [Home(), ProfileView()];
    final AuthSerivce _auth = AuthSerivce();
    return StreamProvider<List<Event>>.value(
      value: DatabaseService().events,
      child: Scaffold(
        appBar: AppBar(
          title: Text("MeetApp"),
          backgroundColor: Colors.blueGrey[600],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Log out"),
            )
          ],
        ),
        // body: pages.elementAt(mySelectedPosition),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: "Profile",
            )
          ],
          currentIndex: mySelectedPosition,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // return addEventDialog();
            },
            label: Icon(Icons.add_circle)),
      ),
    );
  }

  // Future addEventDialog() => showGeneralDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //     barrierColor: Colors.black45,
  //     transitionDuration: const Duration(milliseconds: 200),
  //     pageBuilder: (BuildContext buildContext, Animation animation,
  //         Animation secondaryAnimation) {
  //       return Center(
  //         child: Container(
  //
  //           padding: EdgeInsets.all(20),
  //           color: Colors.white,
  //           child: Column(
  //             children: [
  //               Container(),
  //               Text("Ajde"),
  //               TextField(),
  //               Text("Ajde"),
  //               TextField(),
  //               Text("Ajde"),
  //               InputDatePickerFormField(
  //                 firstDate: DateTime(2019),
  //                 lastDate: DateTime(2020, 12, 12),
  //                 initialDate: selectedDate,
  //                 onDateSubmitted: (date) {
  //                   setState(() {
  //                     selectedDate = date;
  //                   });
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     });
}

class ViewEvents extends StatefulWidget {
  const ViewEvents({
    Key key,
  }) : super(key: key);

  @override
  _ViewEventsState createState() => _ViewEventsState();
}

class _ViewEventsState extends State<ViewEvents> {
  List<Event> lista = [];
  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 10.0,
    //   crossAxisSpacing: 10.0,
    //   padding: EdgeInsets.all(10),
    //   childAspectRatio: 0.65,
    //   children: List.generate(lista.length, (index) {
    //     return EventCard();
    // //   }),
    // );
    return Text("DOBRO E DO TUKA");
  }
}
