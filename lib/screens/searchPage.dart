import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) async {
              WeatherService cityName = WeatherService();
              WeatherModel weather = await cityName.getWeather(city: data);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).city = data;
              Provider.of<WeatherProvider>(context, listen: false).time =
                  DateTime.now();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Type the city',
              label: Text('Search'),
              contentPadding: EdgeInsets.all(25),
            ),
          ),
        ),
      ),
    );
  }
}
