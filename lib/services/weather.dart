import 'location.dart';
import 'package:climatised/services/networking.dart';
import 'package:climatised/utilities/constants.dart';

class WeatherModel {

  Future <dynamic> getCityWeather (String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('$kOpenWeatherMap?q=$cityName&appid=$kapiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future <dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$kOpenWeatherMap?lat=${location.latitude}&lon=${location.longtitude}&appid=$kapiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time in';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in';
    } else {
      return 'Bring a 🧥 just in case in';
    }
  }
}
