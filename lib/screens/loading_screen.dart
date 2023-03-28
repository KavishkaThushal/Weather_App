import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/constants.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/location.dart';

const kApikey = '201d8940df17c31cbd1e0c1b194d584e';

location locate = location();

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
     WeatherModel weatherModel=WeatherModel();
       var weatherDate=await weatherModel.getLocationWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        weatherData:weatherDate,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:kBackgroundColorStyle,
      body: Center(
        child: SpinKitWave(
          color: Color(0xFF002B5B),
          size: 50.0,
          duration: Duration(milliseconds:1000),
        ),
      ),
    );
  }
}
