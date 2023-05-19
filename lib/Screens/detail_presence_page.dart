import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:async/async.dart';

class MapSample extends StatefulWidget {
  final String checkIn;
  final String checkOut;
  final String status;
  final double longitude;
  final double latitude;
  final String? lateTime;

  const MapSample({
    super.key,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    required this.longitude,
    required this.latitude,
    this.lateTime,
  });

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  double latitude = 0;
  double longitude = 0;
  late CameraPosition _kGooglePlex;
  late Marker _kGooglePlexMarker;

  @override
  void initState() {
    super.initState();
    latitude = widget.latitude;
    longitude = widget.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14.4746,
    );
    _kGooglePlexMarker = Marker(
      markerId: MarkerId('_kGooglePlex'),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(title: 'GooglePlex'),
      icon: BitmapDescriptor.defaultMarker,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Padding(
          padding: EdgeInsets.only(left: screenSize.width * 0.15),
          child: Text(
            'Detail Presence',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 133, 118, 118),
              fontSize: screenSize.width * 0.05,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 133, 118, 118)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Gap(screenSize.height * 0.06),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.06),
            child: Row(
              children: [
                const Icon(
                  Icons.login,
                  color: Color(0xFF6096B4),
                ),
                Gap(screenSize.width * 0.03),
                Text(
                  "Check In : ",
                  style: TextStyle(
                    color: const Color(0xFF6096B4),
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(screenSize.width * 0.03),
                Text(
                  widget.checkIn,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Gap(screenSize.height * 0.02),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6096B4).withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          Gap(screenSize.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.06),
            child: Row(
              children: [
                const Icon(
                  Icons.logout,
                  color: Color(0xFF6096B4),
                ),
                Gap(screenSize.width * 0.03),
                Text(
                  "Check Out : ",
                  style: TextStyle(
                    color: const Color(0xFF6096B4),
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(screenSize.width * 0.03),
                Text(
                  widget.checkOut,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Gap(screenSize.height * 0.02),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6096B4).withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          Gap(screenSize.height * 0.02),
          SizedBox(
            height: screenSize.height * 0.5,
            width: screenSize.width * 0.9,
            child: GoogleMap(
              mapType: MapType.normal,
              markers: {_kGooglePlexMarker},
              // polylines: {_polyline},
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Gap(screenSize.height * 0.05),
          widget.status == "Late"
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                          width:
                              7), // Add some spacing between the icon and the text
                      Text(
                        "You're " + widget.lateTime! + " minutes late !",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          fontSize: screenSize.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                )
              : const Text(""),
        ],
      ),
    );
  }
}
