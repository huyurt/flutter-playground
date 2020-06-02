import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  @override
  _ShowSimpleMapState createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  GoogleMapController mapController;
  static final LatLng center = const LatLng(39.925533, 32.866287);
  static final LatLng anotherLocation = const LatLng(40.02106, 32.83102);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: {ankaraMarker, ankaraMarker2},
        mapType: MapType.terrain,
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(target: center, zoom: 11.0),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: goToAsti,
        label: Text('AŞTİ'),
        icon: Icon(Icons.directions_bus),
      ),
    );
  }

  static final CameraPosition astiPosition = CameraPosition(
      target: LatLng(39.918797, 32.814457),
      bearing: 191.0,
      tilt: 35.0,
      zoom: 16.5);

  Future<void> goToAsti() async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(astiPosition));
  }

  Marker ankaraMarker = Marker(
      markerId: MarkerId('Ankara'),
      position: center,
      infoWindow: InfoWindow(title: 'Ankara', snippet: "Türkiye'nin başkenti."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));

  Marker ankaraMarker2 = Marker(
      markerId: MarkerId('Ankara'),
      position: anotherLocation,
      infoWindow: InfoWindow(
          title: 'Keçiören', snippet: "Ankara'nın en kalabalık ilçesi."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));
}
