import 'package:flutter/material.dart';
import 'package:climatised/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longtitude);
  }

  void getData() async {
    Response response = await get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
     print(response.body);

     if (response.statusCode == 200) {
       String data = response.body;
       print(data);

       var lontitude = jsonDecode(data)['coord']['lon'];
       print(lontitude);
     } else {
       print(response.statusCode);
     }
  }

  @override
  void initState() {
    getLocation();
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
