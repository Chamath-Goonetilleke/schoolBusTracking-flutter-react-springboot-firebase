// Required imports
// import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:location/location.dart';

class LocationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Timer? _locationTimer;
  // StreamSubscription<Position>? _positionStream;
  final String userId; // User ID to store location for specific user

  Location location = new Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionStatus;
  LocationData? _locationData;

  LocationService({required this.userId});

  Future<void> startLocationTracking() async {
    // Request location permissions
    // LocationPermission permission = await Geolocator.requestPermission();
    //
    // if (permission == LocationPermission.denied ||
    //     permission == LocationPermission.deniedForever) {
    //   throw Exception('Location permissions are required');
    // }
    //
    // // Check if location services are enabled
    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   throw Exception('Location services are disabled');
    // }

    _serviceEnabled= await location.serviceEnabled();

    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled){
        return;
      }
    }

    _permissionStatus = await location.hasPermission();
    if(_permissionStatus == PermissionStatus.denied){
      _permissionStatus = await location.requestPermission();
      if(_permissionStatus != PermissionStatus.granted){
        return;
      }
    }

    // Start periodic location updates
    _locationTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      try {
        // Save to Firebase
        await _saveLocationToFirebase(await location.getLocation());
      } catch (e) {
        print('Error getting location: $e');
      }
    });
  }

  Future<void> _saveLocationToFirebase(LocationData position) async {
    try {
      await _firestore
          .collection('locations')
          .doc(userId)
          .set({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error saving location to Firebase: $e');
    }
  }

  Stream<DocumentSnapshot> getLocationUpdates(String targetUserId) {
    return _firestore
        .collection('locations')
        .doc(targetUserId)
        .snapshots();
  }

  void stopLocationTracking() {
    _locationTimer?.cancel();
  }

  // Example of how to handle location updates in your app
  void listenToLocationUpdates(String targetUserId) {
    getLocationUpdates(targetUserId).listen((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        double latitude = data['latitude'];
        double longitude = data['longitude'];
        // Handle the location update
        print('Location updated - Lat: $latitude, Long: $longitude');
      }
    });
  }
}