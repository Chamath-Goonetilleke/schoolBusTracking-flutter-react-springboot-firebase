import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopeon_app/services/location_service.dart';
import 'package:hopeon_app/constants.dart';

class ParentTrackMyBusScreen extends StatefulWidget {
  final String driverId;
  const ParentTrackMyBusScreen({super.key, required this.driverId});

  @override
  State<ParentTrackMyBusScreen> createState() => _ParentTrackMyBusScreenState();
}

class _ParentTrackMyBusScreenState extends State<ParentTrackMyBusScreen> {
  static const googlePlex = LatLng(6.808542, 79.920273);
  static const mountainView = LatLng(6.936113, 79.846069);

  late final LocationService _locationService;
  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};
  StreamSubscription<DocumentSnapshot>? _locationSubscription;
  BitmapDescriptor? busIcon; // Custom marker icon

  @override
  void initState() {
    super.initState();
    _locationService = LocationService(userId: widget.driverId);
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await initializeMap());
    loadCustomMarker();
    loadLoc();
    listenToDriverLocation();
  }

  void loadLoc()async{
   await _locationService.startLocationTracking();
  }

  /// Load custom marker icon
  Future<void> loadCustomMarker() async {
    final BitmapDescriptor icon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)), // Adjust size if needed
      'assets/images/bus.png', // Ensure this file is in assets/
    );
    setState(() {
      busIcon = icon;
    });
  }

  Future<void> initializeMap() async {
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates);
  }

  /// Listens to the driver's location from Firebase and updates the map
  void listenToDriverLocation() {
    _locationSubscription = _locationService
        .getLocationUpdates(widget.driverId)
        .listen((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        print(data);
        final double latitude = data['latitude'];
        final double longitude = data['longitude'];

        if (mounted) {
          setState(() {
            currentPosition = LatLng(latitude, longitude);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Track Vehicle Location")),
    body: currentPosition == null || busIcon == null
        ? const Center(child: CircularProgressIndicator())
        : GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: googlePlex,
        zoom: 13,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('currentLocation'),
          icon: busIcon!, // Use custom bus icon
          position: currentPosition!,
        ),
        const Marker(
          markerId: MarkerId('sourceLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: googlePlex,
        ),
        const Marker(
          markerId: MarkerId('destinationLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: mountainView,
        )
      },
      polylines: Set<Polyline>.of(polylines.values),
    ),
  );

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
        request: PolylineRequest(
          origin: PointLatLng(googlePlex.latitude, googlePlex.longitude),
          destination:
          PointLatLng(mountainView.latitude, mountainView.longitude),
          mode: TravelMode.driving,
        ),
        googleApiKey: googleMapsApiKey);

    debugPrint("Polyline Status: ${result.status}");
    debugPrint("Error Message: ${result.errorMessage}");
    debugPrint("Points Count: ${result.points.length}");

    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() => polylines[id] = polyline);
  }
}
