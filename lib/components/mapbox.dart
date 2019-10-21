import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapBox extends StatelessWidget {
  final LatLng _coordinates;

  MapBox(this._coordinates);

  Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }


  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _coordinates,
              zoom: 15.0,
            ),
          ),
        ),
      ],
    );
  }

}