import 'package:flutter/material.dart';
import 'package:forcast_weather/model/forcast_model.dart';
import 'package:forcast_weather/services/current_location.dart';
import 'package:forcast_weather/services/forcast_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ForcastModel? data;

  void getForcast() async {
    var location = await CurrentLocation().myCurrentLocation();

    if (location != null) {
      try {
        data = (await ForcastApi()
            .forcastData(location.longitude!, location.latitude!));

        setState(() {});
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getForcast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('${data?.name}'),
      ),
    );
  }
}
