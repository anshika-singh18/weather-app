import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class locating{
  double lat=0;
  double long=0;

  Future<void> getCurrentPos() async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
          lat = position.latitude;
          long = position.longitude;
    } catch(e){
      print(e);
    }


}
}
//
// mixin Future {
// }