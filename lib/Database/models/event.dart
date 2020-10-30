import 'package:EventApp/Database/models/user.dart';

class Event {
  final String eventID;
  final String time;
  final String date;
  final String location;
  final String sender;
  final List<UserModel> going;

  // Event(String eventID, String time, String date, String location,
  //     String sender, List<UserModel> going) {
  //   eventID = eventID;
  //   time = time;
  //   date = date;
  //   location = location;
  //   sender = sender;
  //   going = going;
  // }
  Event({
    this.eventID = "",
    this.time = "",
    this.date = "",
    this.location = "",
    this.sender = "",
    this.going = const [],
  });

  String get timeE => this.time;
  String get dateE => this.date;
  String get locationE => this.location;
  String get senderE => this.sender;

  Map<String, dynamic> toJson() => {
        "time": time,
        "date": date,
        "location": location,
        "sender": sender,
        "going": going,
      };
}
