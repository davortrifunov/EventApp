import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(),
          Column(
            children: [
              Text("Park"),
              Text("Today at 13:00"),
              Text("Created by: You"),
            ],
          )
        ],
      ),
    );
  }
}
