import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  //Properties
  String location;
  String time;
  String flag;
  String url;

  // Asia/Kolkata

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async{

    try {
      //get Request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      //get Poperties from data
      String dateTime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1,3);
      String offsetMinutes = data['utc_offset'].substring(4,6);

      //create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offsetHours),minutes: int.parse(offsetMinutes)));
      print(now);

      //set time property
      time = now.toString();
    }
    catch ( e ) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }


  }

}