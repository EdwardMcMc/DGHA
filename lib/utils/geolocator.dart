import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Geolocation {
  final Geolocator _geolocator = Geolocator();
  String state;

  Geolocation() {
    _updateState();
  }

  // TODO: implement permission checking
  void _checkPermission() {
    throw new UnimplementedError();
  }

  /// @returns [Future<Position>] from updated [Geolocator] fetch
  Future<Position> _updatePosition() async {
    Position newPosition = await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest)
        .timeout(new Duration(seconds: 5));
    return newPosition;
  }

  /// calls [_updatePosition] to fetch new [Position]
  /// converts [Position] into [Placemark]
  /// sets [state] to updated administrativeArea
  void _updateState() async {
    Position position = await _updatePosition();
    List<Placemark> placemark =
        await _geolocator.placemarkFromPosition(position);
    state = placemark.first.administrativeArea;
  }
}
