import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime{
  String location; //location name for UI
  String time; //time in that location
  String flag; //image of flag for location
  String url; //location url got apo end point
  bool isDayTime; //true of false if daytime or not

  WorldTime({ this.location, this.flag, this.url});

  Future <void> getTime() async {
try{
  Response response = await get ('https://worldtimeapi.org/api/timezone/$url');
  Map data = jsonDecode(response.body);

  //get properties from data
  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);

  //create DateTime object
  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset)));

  isDayTime = now.hour > 6 && now.hour <20 ? true : false;
  time = DateFormat.jm().format(now);
}
  catch(e)
      {
  print('$e');
  time = 'could not get the time data';
      }

  }


}