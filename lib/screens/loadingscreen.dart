import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';
import 'package:http/http.dart';
import 'locationscreen.dart';

const apiKey = '68ff8c5f6a2c9b0d67ba4476cf11fc5f';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lati=0;
  double longi=0;
@override
  void initState(){
    super.initState();
    getlocation();
  }
  void getlocation() async{
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    locating locator = locating();
    await locator.getCurrentPos();
    Response response=await get(Uri.parse('https://api.openweathermap.org/data/2.'
        '5/weather?lat=${locator.lat}&lon=${locator.long}&appid=$apiKey&units=metric'));
    print(response.body);
    if (response.statusCode==200){
      String data=response.body;
      var weather_description = jsonDecode(data);
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(
          locationweather: weather_description,
        );
      }));

      // print(data);
      // var weather_description = jsonDecode(data)['weather'][0]['description'];
      // print(weather_description);
    }

    else{
      print(response.statusCode);
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitDoubleBounce(
            color: Colors.white70,
            size: 75.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('Fetching weather of your location!',
          style: TextStyle(
            color: Colors.white70,
            fontStyle: FontStyle.italic,
          ),),
        ],
      ),
    );
  }
}
// body: SpinKitDoubleBounce(
// color: Colors.white70,
// size: 100.0,
// ),