import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/driver_screens/DriverTripProgressScreen.dart';

class DriverTripTrackingScreen extends StatefulWidget {
  const DriverTripTrackingScreen({super.key});

  @override
  State<DriverTripTrackingScreen> createState() => _DriverTripTrackingScreenState();
}

class _DriverTripTrackingScreenState extends State<DriverTripTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Today Trip Tracking", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
        ),
        backgroundColor: const Color.fromRGBO(37, 100, 255, 1.0),
        toolbarHeight: 100.0, // Increases the height of the AppBar
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Date: "+DateTime.now().toIso8601String().split("T")[0], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            const SizedBox(height: 60,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("To School Trip", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const Divider(),
                    const Text("Status: ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      padding: const EdgeInsets.all(10),
                      color: const Color.fromRGBO(37, 100, 255, 1.0),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DriverTripProgressScreen()),
                        );
                      },
                      minWidth: double.infinity,
                      child: const Text("Track the Trip",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                    const SizedBox(height: 20,),
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
                const SizedBox(height: 150,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("To Home Trip", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const Divider(),
                    const Text("Status: ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      padding: const EdgeInsets.all(10),
                      color: const Color.fromRGBO(37, 100, 255, 1.0),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DriverTripProgressScreen()),
                        );
                      },
                      minWidth: double.infinity,
                      child: const Text("Track the Trip",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                    const SizedBox(height: 20,),
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
                const SizedBox(height: 40,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
