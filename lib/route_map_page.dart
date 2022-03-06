import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class RouteMapPage extends StatefulWidget {
  @override
  State<RouteMapPage> createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(9.931233,76.267303),
          zoom: 18,
        ),
        onMapCreated: (GoogleMapController controller){
          setState(() {
            googleMapController=controller;
          });
        },

      ),
    );
  }
}
