import 'package:geolocator/geolocator.dart';

class Geolocation {
  final Geolocator _geolocator = Geolocator()
    ..forceAndroidLocationManager = true;
  String state;

  Geolocation() {
    _updateState();
  }

  /// @returns [Future<bool>], true or false respectively if permission is granted.
  Future<bool> _checkPermission() async {
    bool permission = false;
    await _geolocator
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationAlways)
        .then((status) {
      if (status == GeolocationStatus.granted) permission = true;
    });
    await _geolocator
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationWhenInUse)
        .then((status) {
      if (status == GeolocationStatus.granted) permission = true;
    });
    return permission;
  }

  /// @returns [Future<Position>] from updated [Geolocator] fetch
  /// if updating [Position] fails, @returns last known location.
  Future<Position> _updatePosition() async {
    Position newPosition = await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest)
        .timeout(new Duration(seconds: 5))
        .catchError((e) =>
            throw ('Error fetching new position, please try again later.'));
    if (newPosition == null)
      newPosition = await _geolocator.getLastKnownPosition(
          desiredAccuracy: LocationAccuracy.lowest);
    return newPosition;
  }

  /// calls [_updatePosition] to fetch new [Position]
  /// converts [Position] into [Placemark]
  /// sets [state] to updated administrativeArea
  void _updateState() async {
    if (await _checkPermission()) {
      Position position = await _updatePosition();
      List<Placemark> placemark = await _geolocator
          .placemarkFromPosition(position)
          .catchError((e) =>
              throw ('Error converting position to placemark, please try again later.'));
      state = placemark.first.administrativeArea;
    } // else {
    // throw ('You have not granted access to location to this app, please edit this in your settings.');
    // }
  }
}
