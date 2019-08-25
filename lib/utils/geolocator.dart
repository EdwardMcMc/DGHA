import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Geolocation {
  final Geolocator _geolocator = Geolocator();
  Position _position;
  String state;

  Geolocation() {
    _updateLocation();
  }

  // TODO: implement permission checking
  void _checkPermission() {
    throw new UnimplementedError();
  }

  void _updateLocation() async {
    try {
      Position newPosition = await _geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest)
          .timeout(new Duration(seconds: 5));
      _position = newPosition;
    } catch (e) {
      throw ErrorHint('Error: ${e.toString()}');
    }
  }

  void updateState() async {
    _updateLocation();
    List<Placemark> placemark =
        await _geolocator.placemarkFromPosition(_position);
    state = placemark.first.administrativeArea;
  }
}
