import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopeon_app/screens/parent_screens/ParentBottomNavBar.dart';

class ParentTrackMyBusScreen extends StatefulWidget {
  @override
  _ParentTrackMyBusScreenState createState() => _ParentTrackMyBusScreenState();
}

class _ParentTrackMyBusScreenState extends State<ParentTrackMyBusScreen> {
  late GoogleMapController mapController;

  final LatLng _busLocation = const LatLng(6.7103, 80.0591); // Example bus location
  final LatLng _destination = const LatLng(6.7000, 80.0300); // Example destination

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.infinity,
              color: const Color.fromRGBO(37, 100, 255, 1.0),
              padding: const EdgeInsets.fromLTRB(30, 80, 10, 20),
              child: const Text("Track My Bus", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white))
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _busLocation,
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: MarkerId("bus"),
                  position: _busLocation,
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                  infoWindow: InfoWindow(title: "Bus Location"),
                ),
                Marker(
                  markerId: MarkerId("destination"),
                  position: _destination,
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
                  infoWindow: InfoWindow(title: "Destination"),
                ),
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId("route"),
                  color: Colors.black,
                  width: 5,
                  points: [_busLocation, _destination],
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ParentBottomNavBar(selectedScreen: 1),
    );
  }
}
