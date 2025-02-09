import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/driver_screens/DriverTripProgressScreen.dart';
import 'package:hopeon_app/services/location_service.dart';
import 'package:hopeon_app/services/trip_service.dart';

class DriverTripTrackingScreen extends StatefulWidget {
  final String id;

  const DriverTripTrackingScreen({super.key, required this.id});

  @override
  State<DriverTripTrackingScreen> createState() =>
      _DriverTripTrackingScreenState();
}

class _DriverTripTrackingScreenState extends State<DriverTripTrackingScreen> {
  late final LocationService _locationService;
  final TripService _tripService = TripService();

  late Map<String, dynamic>? _toSchool;
  late Map<String, dynamic>? _toHome;
  bool _isLoading = false;

  void _loadToSchoolData() async {
    setState(() {
      _isLoading = true;
    });
    Map<String, dynamic> res = await _tripService.findTrip(
        widget.id, "TO_SCHOOL", DateTime.now().toIso8601String().split("T")[0]);

    if (res['success']) {
      setState(() {
        _toSchool = res['body'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _toSchool = {
          "status": "PENDING",
          "type": "TO_SCHOOL",
          "driverId": widget.id
        };
        _isLoading = false;
      });
    }
  }

  void _loadToHomeData() async {
    setState(() {
      _isLoading = true;
    });
    Map<String, dynamic> res = await _tripService.findTrip(
        widget.id, "TO_HOME", DateTime.now().toIso8601String().split("T")[0]);

    if (res['success']) {
      setState(() {
        _toHome = res['body'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _toHome = {
          "status": "PENDING",
          "type": "TO_HOME",
          "driverId": widget.id
        };
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _locationService = LocationService(userId: widget.id);
    _loadToSchoolData();
    _loadToHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Today Trip Tracking",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromRGBO(37, 100, 255, 1.0),
        toolbarHeight: 100.0, // Increases the height of the AppBar
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.blue,
            ))
          : Container(
              padding: const EdgeInsets.all(30.0),
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Date: " + DateTime.now().toIso8601String().split("T")[0],
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("To School Trip",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          const Divider(),
                          Text("Status: ${_toSchool?["status"] ?? ""}",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.all(10),
                            color: const Color.fromRGBO(37, 100, 255, 1.0),
                            onPressed: () async {
                              //await _locationService.startLocationTracking();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DriverTripProgressScreen(
                                          trip: _toSchool!,
                                        )),
                              );
                            },
                            minWidth: double.infinity,
                            child: const Text("Track the Trip",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // MaterialButton(
                          //
                          //   padding: const EdgeInsets.all(10),
                          //   color: const Color.fromRGBO(37, 100, 255, 1.0),
                          //   onPressed: () {},
                          //   minWidth: double.infinity,
                          //   child: const Text("To School Trip",
                          //       style: TextStyle(fontSize: 16, color: Colors.white)),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("To Home Trip",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          const Divider(),
                          Text("Status: ${_toHome?["status"] ?? ""}",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.all(10),
                            color: const Color.fromRGBO(37, 100, 255, 1.0),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DriverTripProgressScreen(
                                          trip: _toHome!,
                                        )),
                              );
                            },
                            minWidth: double.infinity,
                            child: const Text("Track the Trip",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // MaterialButton(
                          //
                          //   padding: const EdgeInsets.all(10),
                          //   color: const Color.fromRGBO(37, 100, 255, 1.0),
                          //   onPressed: () {},
                          //   minWidth: double.infinity,
                          //   child: const Text("To School Trip",
                          //       style: TextStyle(fontSize: 16, color: Colors.white)),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
