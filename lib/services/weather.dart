import 'package:weather/screens/loading_screen.dart';
import 'package:weather/services/networking.dart';
const kUrl='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {


  Future<dynamic> getCityWeather(cityName)async{
     Network networkHelper = Network('$kUrl?q=$cityName&appid=$kApikey&units=metric');
     var weatherData = await networkHelper.getData();
     return weatherData;
   }

  Future<dynamic> getLocationWeatherData()async{
    await locate.getCurrentPosition();
    Network networkHelper = Network(
        '$kUrl?lat=${locate.latitude}&lon=${locate.longitude}&appid=$kApikey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧 ';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍';
    }
  }
  String getWeatherMsg(int condition) {
    if (condition < 300) {
      return 'Thunderstorm';
    } else if (condition < 400) {
      return '	Drizzle';
    } else if (condition < 600) {
      return '	Rain';
    } else if (condition < 700) {
      return 'Snow';
    } else if (condition < 800) {
      return 'Fog';
    } else if (condition == 800) {
      return 'Clear';
    } else if (condition <= 804) {
      return 'Cloud';
    } else {
      return 'unknown';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
