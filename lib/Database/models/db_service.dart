import 'package:EventApp/Database/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference collection =
      FirebaseFirestore.instance.collection("events");

  Future updateEventData(Event e) async {
    return await collection.doc(uid).set({
      'eventID': e.eventID,
      'time': e.time,
      'date': e.date,
      'location': e.location,
      'sender': e.sender,
      'going': e.going,
    });
  }

  Future deleteEvent(Event e) async {
    return await collection.doc(uid).delete();
  }

  Stream<List<Event>> get events => collection.snapshots().map(_getEvents);

  List<Event> _getEvents(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((e) {
        return Event(
          eventID: e.id,
          time: e.data()["time"] ?? "",
          date: e.data()["date"] ?? "",
          location: e.data()["location"] ?? "",
          sender: e.data()["sender"] ?? "",
          going: List.from(e.data()["going"]) ?? "",
        );
      }).toList();
    } catch (e) {
      print(e);
    }
  }
}
