import 'package:EventApp/Database/models/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  EventCard({Key key, this.nastan}) : super(key: key);
  final Event nastan;

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Material(
          elevation: 5.0,
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          child: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => DetailPage(
              //       data: widget.product,
              //       index: widget.index,
              //     ),
              //   ),
              // );
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nastan.location,
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  // Hero(
                  //   tag: widget.event,
                  //   child: CircleAvatar(
                  //     backgroundColor: Colors.transparent,
                  //     maxRadius: 60,
                  //     child: Image(
                  //       image: AssetImage(widget.product.imagePath),
                  //       height: MediaQuery.of(context).size.height * 0.5,
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
