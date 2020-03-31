import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time ='loading';
  void setupWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Jamaica', flag: 'Jamaica.png', url: 'America/Jamaica');
    await instance.getTime();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDayTime' : instance.isDayTime,
   });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.indigoAccent,
          size: 40,
        ),
      ),
    );
  }
}
