import 'package:http/http.dart';
import 'dart:convert';

class Network{
  Network(this.url);
  final String url;

  Future getData()async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decoder = jsonDecode(data);
      return decoder;
    } else {
      print(response.statusCode);
    }
  }

}