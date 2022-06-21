import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tsetrun/screens/recy_screen.dart';

import 'home_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _pageIndex = 2;

  final pages = [HomeScreen(), const MapScreen(), RecyScreen()];

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Recycle',
      style: optionStyle,
    ),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Map',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecyScreen()),
        );
      } else {
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapScreen()),
          );
        }
      }
    });
  }

  var recycleStations = HashSet<Marker>();
  var myLat = 0.0;
  var myLong = 0.0;
  var position;

//get user current location
  void getCurrent() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      lastPosition = position;
    });
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(23.615189, 418.200264),
    zoom: 14,
  );
late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text('Recycling stations around you'),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController _googleMapController) {
          setState(() {
            recycleStations.add(
              const Marker(
                markerId: MarkerId('1'),
                position: LatLng(23.680923, 418.130560),
                infoWindow:
                    InfoWindow(title: 'Recycling station: Plastic ,Glass'),
              ),
            );
            recycleStations.add(
              const Marker(
                markerId: const MarkerId('2'),
                position: const LatLng(23.655138, 418.163505),
                infoWindow:
                    const InfoWindow(title: 'Recycling station: Electronics'),
              ),
            );
            recycleStations.add(
              const Marker(
                markerId: MarkerId('3'),
                position: const LatLng(23.621485, 418.192669),
                infoWindow:
                    const InfoWindow(title: 'Recycling station: Paper , Glass'),
              ),
            );
            recycleStations.add(
              const Marker(
                markerId: const MarkerId('4'),
                position: const LatLng(23.606071, 418.204509),
                infoWindow: const InfoWindow(
                    title: 'Recycling station: Electronics , Metal'),
              ),
            );
            recycleStations.add(
              const Marker(
                markerId: MarkerId('5'),
                position: const LatLng(23.619283, 418.249145),
                infoWindow:
                    const InfoWindow(title: 'Recycling station: Plastic'),
              ),
            );
            recycleStations.add(
              const Marker(
                markerId: MarkerId('6'),
                position: const LatLng(23.569258, 418.253613),
                infoWindow:
                    InfoWindow(title: 'Recycling station: Paper, Metal'),
              ),
            );
            recycleStations.add(
              const Marker(
                markerId: const MarkerId('7'),
                position: const LatLng(23.606258, 418.187627),
                infoWindow:
                    const InfoWindow(title: 'Recycling station: Plastic'),
              ),
            );
            recycleStations.add(
              const Marker(
                markerId: const MarkerId('8'),
                position: const LatLng(23.600123, 418.172417),
                infoWindow: const InfoWindow(title: 'Recycling station: Glass'),
              ),
            );
          });
        },
        markers: recycleStations,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            _initialCameraPosition,
          ),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: 'recycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Maps',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
