import 'package:location/location.dart';

class CurrentLocation {
  final location = Location();

  Future<LocationData?> myCurrentLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    PermissionStatus userPermission = await location.hasPermission();
    if (userPermission == PermissionStatus.denied) {
      userPermission = await location.requestPermission();
      if (userPermission == PermissionStatus.denied) {
        return null;
      }
    }
    return location.getLocation();
  }
}
