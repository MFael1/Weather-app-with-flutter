class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherState;
  double avghumidity;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState,
      required this.avghumidity});

  factory WeatherModel.fromjson(Map<String, dynamic> data) {
    var jasonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['name'],
        temp: jasonData['avgtemp_c'],
        maxTemp: jasonData['maxtemp_c'],
        minTemp: jasonData['mintemp_c'],
        weatherState: jasonData['condition']['text'],
        avghumidity: jasonData['avghumidity']);
  }

  String? getImage() {
    if (temp > 30)
      return 'assets/images/clear.png';
    else if (temp < 30 && temp > 20)
      return 'assets/images/cloudy.png';
    else
      return 'assets/images/rainy.png';
  }
}
