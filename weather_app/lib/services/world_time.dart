import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
class WorldTime {
  String location;
  String time  = "";
  String flag;
  late String url;

  Future<void> getTime() async {
    try {
      var link = Uri.parse( "http://worldtimeapi.org/api/timezone/${url}" );
      Response response = await get(link);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = now.toString();
    }
    catch (e) {
      time = 'could not get time data';
    }

  }
  WorldTime({required this.location, required this.flag, required this.url});

}

