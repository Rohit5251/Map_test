import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class LocationServices extends StatefulWidget {
  const LocationServices({super.key});

  @override
  State<LocationServices> createState() => _LocationServicesState();
}

class _LocationServicesState extends State<LocationServices> {
  getCurrentLocation () async{
    LocationPermission permission= await Geolocator.checkPermission();
    if(permission==LocationPermission.denied || permission==LocationPermission.deniedForever){
        print("Location Denied");
        LocationPermission ask=await Geolocator.requestPermission();

    }
    else{
      Position currentPosition=await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.best);
      print(currentPosition.latitude.toString());
      print(currentPosition.longitude.toString());
      log(currentPosition.latitude);
      log(currentPosition.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("location"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: getCurrentLocation,child: Text("get location")),
      ),
    );
  }
}
