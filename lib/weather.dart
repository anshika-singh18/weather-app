// import 'dart:html';
// import 'dart:io';
import 'package:flutter/material.dart';

class WeatherMode{
  String getWeatherIcon(int condition){

    if (condition<300){
      return 'cloud';
    }else if(condition<400){
      return 'cloud';
    }else if(condition<600){
      return 'cloud';
    }else if(condition<700){
      return 'cloud';
    }else if(condition<800){
      return 'cloud';
    }else if(condition==800){
      return 'cloud';
    }else if(condition<=804){
      return 'cloud';
    }else{
      return 'cloud';
    }
  }

  String message(double temp){
    if (temp>25){
      return 'It\'s 🍦 time';
    } else if(temp >20){
      return 'Time for 🩳 and 👕';
    } else if(temp<10){
      return 'You\'ll need 🥊 and 🧥';
    } else{
      return 'Bring a ☂ just in case';
    }
  }
}