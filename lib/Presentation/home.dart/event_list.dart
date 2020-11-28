import 'package:EventApp/Database/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../event_card.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<List<Event>>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo[300],
        onPressed: () {
          return addDialog();
        },
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          padding: EdgeInsets.only(top: 10),
          childAspectRatio: 3.5,
          children: List.generate(list.length, (index) {
            return EventCard(list[index]);
          }),
        ),
      ),
    );
  }

  AlertDialog addDialog() => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 15,
        content: Container(
          // height: MediaQuery.of(context).size.height * 0.6,
          // width: MediaQuery.of(context).size.width * 0.95,
          height: 600,
          width: 400,
          child: Column(
            children: [
              Text("WhatsUp"),
            ],
          ),
        ),
      );
}
