import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/constants.dart';

import '../utilities/category.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.weatherData});
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature = 0;
  String cityName = '';
  String weatherIcon = '';
  String msg = '';
  String weatherMsg='';
  int wind=0;
  int humidity=0;
  int seaLevel=0;
  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData);
  }

  void updateData(weatherData) {
    if (weatherData == null) {
      temperature = 0;
      cityName = 'unknown';
      weatherIcon = 'error';
      msg = 'error found';
      wind=0;
      humidity=0;
      seaLevel=0;

      return;
    }
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    cityName = weatherData['name'];
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    msg = weather.getMessage(temperature);
    weatherMsg=weather.getWeatherMsg(condition);
    double win=weatherData['wind']['speed'];
    wind=win.toInt();
    humidity=weatherData['main']['humidity'];
    seaLevel=weatherData['main']['sea_level'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColorStyle,
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeatherData();
                      setState(() {
                        updateData(weatherData);
                      });
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: kIconColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CityScreen();
                      }));
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        setState(() {
                          updateData(weatherData);
                        });
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: kIconColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(10.0),

                  decoration: BoxDecoration(
                    color: kCategoryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 50.0,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          weatherMsg,
                          style: kTitleDesc,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color:kCategoryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 300.0,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 300.0,
                          ),
                          child: Text(
                            "$msg in $cityName!",
                            textAlign: TextAlign.center,
                            style: kMessageTextStyle,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child:CategoryStyle(title:'Wind', value:'$wind' , icon:'🌫'),
                    ),
                    Expanded(
                      child:CategoryStyle(title:'Humidity', value:'$humidity' , icon:'💧'),
                    ),
                    Expanded(
                      child:CategoryStyle(title:'Sea Level', value:'$seaLevel' , icon:'🌊'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

