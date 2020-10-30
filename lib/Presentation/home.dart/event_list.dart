import 'package:EventApp/Database/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final eventss = Provider.of<List<Event>>(context);
    eventss.forEach((event) {
      print(event.sender);
    });
    return Container();
  }
}
