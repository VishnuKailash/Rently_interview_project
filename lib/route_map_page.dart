import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class RouteMapPage extends StatefulWidget {
  @override
  State<RouteMapPage> createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
 GoogleMapController? googleMapController;
 CameraPosition cameraPosition=const CameraPosition(target: LatLng(9.931233,76.267303));


 @override
 void dispose() {
   googleMapController?.dispose();
   super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ROUTE MAP",style: TextStyle(fontSize: 15),),centerTitle: true,elevation: 0,),
      body:GoogleMap(
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController controller){
          setState(() {
            googleMapController=controller;
          });
        },

      ),
    );
  }
}
