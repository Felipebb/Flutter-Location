import 'dart:async';
import 'package:location/location.dart';
import '../../main.dart';

class LocationService {

  var location = Location();

  StreamController _locationController = StreamController<MyHomePage>();
  Stream get locationStream => _locationController.stream;

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted != null) {
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.sink.add(MyHomePage(
              lat: locationData.latitude,
              long: locationData.longitude,
            ));
          }
        });
      }
    });
  }

  void dispose() {
    _locationController.close();

  }
}