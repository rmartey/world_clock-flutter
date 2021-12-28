// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  late String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; // location url for api endpoint
  late bool isDayTime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // print(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);

      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      //setting wheather daytime or not
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;

      //set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "could no get time data";
    }
  }
}
