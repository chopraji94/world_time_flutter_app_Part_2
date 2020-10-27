import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{

    //get Request
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
    Map data = jsonDecode(response.body);
    // print(data);

    //get Poperties from data
    String dateTime = data['datetime'];
    String offsetHours = data['utc_offset'].substring(1,3);
    String offsetMinutes = data['utc_offset'].substring(4,6);
    // print(dateTime);
    // print(offsetHours);
    // print(offsetMinutes);

    //create DateTime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offsetHours),minutes: int.parse(offsetMinutes)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Loading screen'
      ),
    );
  }
}
