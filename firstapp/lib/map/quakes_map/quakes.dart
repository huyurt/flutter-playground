import 'dart:async';

import 'package:firstapp/map/quakes_map/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'model/quake.dart';

class QuakesApp extends StatefulWidget {
  @override
  _QuakesAppState createState() => _QuakesAppState();
}

class _QuakesAppState extends State<QuakesApp> {
  Future<Quake> quakesData;
  Completer<GoogleMapController> controller = Completer();
  List<Marker> markerList = <Marker>[];
  double zoomValue = 5.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quakesData = Api().getAllQuakes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildGoogleMap(context),
          zoomMinus(),
          zoomPlus(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            findQuakes();
          },
          label: Text('Find Quakes')),
    );
  }

  Widget zoomPlus() {
    return Padding(
      padding: EdgeInsets.only(top: 38.0),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: Icon(
            FontAwesomeIcons.searchPlus,
            color: Colors.black87,
          ),
          onPressed: () {
            zoomValue++;
            plus(zoomValue);
          },
        ),
      ),
    );
  }

  Widget zoomMinus() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            zoomValue--;
            minus(zoomValue);
          },
          icon: Icon(FontAwesomeIcons.searchMinus, color: Colors.black87),
        ),
      ),
    );
  }

  Widget buildGoogleMap(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          this.controller.complete(controller);
        },
        initialCameraPosition:
            CameraPosition(target: LatLng(39.925533, 32.866287), zoom: 3),
        markers: Set<Marker>.of(markerList),
      ),
    );
  }

  void findQuakes() {
    setState(() {
      markerList.clear();
      handleResponse();
    });
  }

  void handleResponse() {
    setState(() {
      quakesData.then((quakes) => {
            quakes.features.forEach((quake) {
              markerList.add(Marker(
                  markerId: MarkerId(quake.id),
                  infoWindow: InfoWindow(
                      title: quake.properties.mag.toString(),
                      snippet: quake.properties.title),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueMagenta),
                  position: LatLng(quake.geometry.coordinates[1],
                      quake.geometry.coordinates[0]),
                  onTap: () {}));
            })
          });
    });
  }

  Future<void> minus(double zoomValue) async {
    final GoogleMapController controller = await this.controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(39.925533, 32.866287), zoom: zoomValue)));
  }

  Future<void> plus(double zoomValue) async {
    final GoogleMapController controller = await this.controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(39.925533, 32.866287), zoom: zoomValue)));
  }
}
