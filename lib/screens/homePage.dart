import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screens/searchPage.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    DateTime? dt = Provider.of<WeatherProvider>(context).time;
    return Scaffold(
      appBar: AppBar(
        title: const Text("what's the weather?"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                children: [
                  const Spacer(flex: 5),
                  const Text(
                    "Please enter your city",
                    style: TextStyle(fontSize: 30),
                  ),
                  const Spacer(flex: 2),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SearchPage();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.search_outlined),
                    iconSize: 90,
                  ),
                  Spacer(flex: 2),
                ],
              ),
            )
          : Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).city!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Text('Updated at: ${dt!.hour}:${dt.minute}'),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()!),
                      Text(
                        weatherData!.temp.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Column(
                        children: [
                          Text(weatherData!.maxTemp.toString()),
                          Text(weatherData!.minTemp.toString()),
                        ],
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    weatherData!.weatherState,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
