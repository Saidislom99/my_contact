import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<Placemark> placemarkList = [];
  List<Location> locations = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _controller,
            ),
            Text(
              locations.isEmpty
                  ? 'Adress'
                  : locations.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          locations = await locationFromAddress(_controller.text);
          setState((){});
          debugPrint(
              "LaT:${locations[0].latitude.toString()} Long:${locations[0].longitude}");
        },
        tooltip: "GEt Adress",
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
