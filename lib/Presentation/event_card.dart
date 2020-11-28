import 'package:EventApp/Database/models/event.dart';
import 'package:EventApp/Presentation/detail_screen.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  EventCard(this.event);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsScreen(event)));
      },
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      event.location,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(event.date + " at " + event.time),
                    Text(
                      "Created by: " + event.sender,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
