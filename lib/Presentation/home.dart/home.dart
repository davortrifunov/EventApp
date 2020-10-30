import 'package:EventApp/Database/models/db_service.dart';
import 'package:EventApp/Database/models/event.dart';
import 'package:EventApp/Presentation/home.dart/event_list.dart';
import 'package:EventApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthSerivce _auth = AuthSerivce();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Event>>.value(
      value: DatabaseService().events,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[800],
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
        body: EventList(),
      ),
    );
  }
}
