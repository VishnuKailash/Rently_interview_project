import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class RouteMapPage extends StatefulWidget {
  @override
  State<RouteMapPage> createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
 GoogleMapController? googleMapController;
 CameraPosition cameraPosition=const CameraPosition(target: LatLng(9.931233,76.267303),zoom: 10);

 static  LatLng _center =  LatLng(9.931233,76.267303);
 final Set<Marker> _markers = {};
 final Set<Polyline>_polyline={};

  LatLng _lastMapPosition= _center;

 List<LatLng> polyLineCoordinates=[];
 LatLng coimbatore = LatLng(11.016844, 76.955833);
 LatLng madurai = LatLng(9.925201, 78.119774);
 LatLng munnar = LatLng(10.087500, 77.061699);
 LatLng kochi = LatLng(9.931233,76.267303);


@override
  void initState() {
  polyLineCoordinates.add(kochi);
  polyLineCoordinates.add(coimbatore);
  polyLineCoordinates.add(madurai);
  polyLineCoordinates.add(munnar);
  polyLineCoordinates.add(kochi);
    super.initState();
  }
 @override
 void dispose() {
   googleMapController?.dispose();
   super.dispose();
 }

 void onAddMarkerButtonPressed() {
  print("Clicked");
   setState(() {
     _markers.add(Marker(
       markerId: MarkerId(_lastMapPosition.toString()),
       position: _lastMapPosition,
       infoWindow: InfoWindow(
         title: 'Kochi',
         snippet: 'Kerala',
       ),
       icon: BitmapDescriptor.defaultMarker,

     ));
     _markers.add(Marker(
       markerId: MarkerId(coimbatore.toString()),
       position: coimbatore,
       infoWindow: InfoWindow(
         title: 'Coimbatore',
         snippet: 'TamilNadu',
       ),
       icon: BitmapDescriptor.defaultMarkerWithHue(12),
     ));
     _markers.add(Marker(
       markerId: MarkerId(madurai.toString()),
       position: madurai,
       infoWindow: InfoWindow(
         title: 'Madurai',
         snippet: 'TamilNadu',
       ),
       icon: BitmapDescriptor.defaultMarkerWithHue(12),
     ));
     _markers.add(Marker(
       markerId: MarkerId(munnar.toString()),
       position: munnar,
       infoWindow: InfoWindow(
         title: 'Munnar',
         snippet: 'TamilNadu',
       ),
       icon: BitmapDescriptor.defaultMarkerWithHue(12),
     ));
     _polyline.add(Polyline(
       polylineId: PolylineId(_lastMapPosition.toString()),
       visible: true,
       points: polyLineCoordinates,
       color: Colors.blue,
     ));
   });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ROUTE MAP",style: TextStyle(fontSize: 15),),centerTitle: true,elevation: 0,
        actions: [
          TextButton(
          onPressed: ()=>onAddMarkerButtonPressed(),
        child: Text("View Route",style: TextStyle(color: Colors.white)),
          )

        ],
      ),
      body:GoogleMap(
        polylines:_polyline,
        markers: _markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
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
