import 'package:EventApp/Database/models/box.dart';
import 'package:EventApp/Database/models/db_service.dart';
import 'package:EventApp/Database/models/event.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen(this.event);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("MeetApp"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Boxx(MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Text(
                event.location,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Boxx(10),
            Center(
              child: Text(
                event.time,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Boxx(5),
            Center(
              child: Text(
                event.date,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(
              child: Text(
                "Created by: " + event.sender,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Boxx(20),
            Center(
              child: Text(
                "Going",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(child: getTextWidgets(event.going)),
            Boxx(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.blueGrey[200],
                  child: Icon(
                    Icons.refresh_outlined,
                    color: Colors.green,
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    await DatabaseService().deleteEvent(event);
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  color: Colors.blueGrey[200],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.25),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget getTextWidgets(List<String> strings) {
  List<Widget> list = new List<Widget>();
  for (var i = 0; i < strings.length; i++) {
    i + 1 != strings.length
        ? list.add(new Text(strings[i] + ", "))
        : list.add(new Text(strings[i]));
  }
  return new Row(
    children: list,
    mainAxisAlignment: MainAxisAlignment.center,
  );
}
