// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:locate/weather.dart';
import 'package:intl/intl.dart';
import 'moreinfo.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({this.locationweather});
  final locationweather;



  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  ScrollController scrollController = ScrollController();
  var containerKey = GlobalKey();
  var currentdate;
  var container2Key = GlobalKey();
  WeatherMode weather = WeatherMode();
  double temperature=0;
  double feellike_temp = 0;
  int humidity =0;
  String weathericon='';
  String cityname='';
  String weatherMessage='';
  double longitude = 0;
  double latitude = 0;
  int pressure = 0;
  double mintemp =0;
  double maxtemp =0;

  @override
  void initState(){
    currentdate = DateTime.now();
    super.initState();
    print(widget.locationweather);
    updateUI(widget.locationweather);
  }

  void get_location() async{
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        locationweather: weatherMessage,
      );
    }));
  }

  void updateUI(dynamic weather_description){
    temperature = weather_description['main']['temp'];
    mintemp = weather_description['main']['temp_min'];
    feellike_temp = weather_description['main']['feels_like'];
    maxtemp = weather_description['main']['temp_max'];
    humidity = weather_description['main']['humidity'];
    pressure = weather_description['main']['pressure'];
    var condition = weather_description['weather'][0]['id'];
    weathericon=weather.getWeatherIcon(condition);
    cityname = weather_description['name'];
    weatherMessage = weather.message(temperature);
    setState(() {

    });
    print(temperature);
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 600.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  // spreadRadius: 5,
                  blurRadius: 5,
                  // offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(40.0),
              gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF88E7D0),
                    Color(0xFF0C621A).withOpacity(0.10),
                  ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, screenwidth*0.07, 0.0, screenwidth*0.02),
                  child: Text('$formattedDate'),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, screenwidth*0.04, 0.0, screenwidth*0.02),
                  child: Text('$cityname',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, screenwidth*0.02, 0.0, screenheight*0.02),
                  child: Image(image: AssetImage('assets/${weathericon}.png'),
                  height: screenheight*0.3,
                  ),
                ),

                Text('Temperature'),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenheight*0.003, horizontal: screenheight*0.08),
                child: Text('$temperature°',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  // textAlign: TextAlign.center,
                ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, screenheight*0.05, 0.0, screenheight*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Feels Like:  ',
                        style: TextStyle(
                          fontSize: screenheight*0.02,
                        ),
                      ),
                      Text('$feellike_temp°',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.fromLTRB(0.0, screenheight*0.001, 0.0, screenheight*0.03),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(0.0),
                    ),
                    height: 20.0,
                    child: GestureDetector(
                      onTap: (){
                            Navigator.push(
                            context, ScaleTransition1(MoreInfo()));
                      },
                    ),
                    // color: Colors.black54,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(' Min Temp: ',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),),
                Text('${mintemp}  ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(' Max Temp: ',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),),
                Text('${maxtemp}',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 25.0,
                  image: AssetImage('assets/humidity.png'),
                ),
                Text(' Humidity: ',
                style: TextStyle(
                  fontSize: 15.0,
                ),),
                Text('${humidity}',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(
                  width: 25.0,
                ),

                Image(
                  height: 25.0,
                  image: AssetImage('assets/pressure.png'),

                ),
                Text(' Pressure: ',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),),
                Text('${pressure}',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class ScaleTransition1 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition1(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 700),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return ScaleTransition(
        alignment: Alignment.bottomCenter,
        scale: animation,
        child: child,
      );
    },
  );
}




