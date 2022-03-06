import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class RouteMapPage extends StatefulWidget {
  @override
  State<RouteMapPage> createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
 GoogleMapController? googleMapController;
 CameraPosition cameraPosition=const CameraPosition(target: LatLng(9.931233,76.267303),zoom: 12);

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
       // This marker id can be anything that uniquely identifies each marker.
       markerId: MarkerId(_lastMapPosition.toString()),
       //_lastMapPosition is any coordinate which should be your default
       //position when map opens up
       position: _lastMapPosition,
       infoWindow: InfoWindow(
         title: 'Really cool place',
         snippet: '5 Star Rating',
       ),
       icon: BitmapDescriptor.defaultMarker,

     ));
     _polyline.add(Polyline(
       polylineId: PolylineId(_lastMapPosition.toString()),
       visible: true,
       //latlng is List<LatLng>
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
