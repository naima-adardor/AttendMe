import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:async/async.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    position: LatLng(37.42796133580664, -122.085749655962),
    infoWindow: InfoWindow(title: 'GooglePlex'),
    icon: BitmapDescriptor.defaultMarker,
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  static final Marker _kLakeMarker = Marker(
    markerId: MarkerId('_kLakePlex'),
    infoWindow: InfoWindow(title: 'LakePlex'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(37.43296265331129, -122.08832357078792),
  );
  static final Polyline _polyline = Polyline(
    polylineId: PolylineId('poly'),
    color: Colors.blue,
    points: const <LatLng>[
      LatLng(37.42796133580664, -122.085749655962),
      LatLng(37.43296265331129, -122.08832357078792),
    ],
    width: 5,
  );
  static final Polygon _kPolygon = Polygon(
      polygonId: PolygonId('_kPolygon'),
      points: [
        LatLng(37.42796133580664, -122.085749655962),
        LatLng(37.43296265331129, -122.08832357078792),
        LatLng(37.418, -122.092),
        LatLng(37.435, -122.092),
      ],
      strokeWidth: 5,
      strokeColor: Colors.blue,
      fillColor: Colors.transparent);
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
                  "09:00",
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
                  "16:00",
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
                  Icons.timelapse_rounded,
                  color: Color(0xFF6096B4),
                ),
                Gap(screenSize.width * 0.03),
                Text(
                  "Working Hours : ",
                  style: TextStyle(
                    color: const Color(0xFF6096B4),
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(screenSize.width * 0.03),
                Text(
                  "12 Hours ",
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
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
