import 'package:geolocator/geolocator.dart';

class location{
  double latitude=0.0;
  double longitude=0.0;

  Future<void> getCurrentPosition()async{
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude=position.latitude;
      longitude=position.longitude;
    }catch(e){
      print(e);
    }
  }

}