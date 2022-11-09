import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
class WorldTime {
  String location;
  String time  = "";
  String flag;
  late String url;
  bool isDaytime = false;

  Future<void> getTime() async {
    try {
      var link = Uri.parse( "http://worldtimeapi.org/api/timezone/${url}" );
      Response response = await get(link);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      String offset2 = data['utc_offset'].substring(4,6);
      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      now = now.add(Duration(minutes: int.parse(offset2)));


      isDaytime = now.hour > 7 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      time = 'could not get time data';
    }

  }
  WorldTime({required this.location, required this.flag, required this.url});

}

