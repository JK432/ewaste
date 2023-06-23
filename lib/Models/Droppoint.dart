import 'dart:html';

class Droppoint {
  String id;
  String adress;
  String lat;
  String lon;
  String cmpnyid;
  Droppoint({this.id = "", this.adress = "", this.lat = "", this.lon = "",this.cmpnyid=""});
  Map<String, dynamic> toJson() => {
    'id': id,
    'adress': adress,
    'lat': lat,
    'lon': lon,
    'cmpnyid':cmpnyid
  };
  static Droppoint fromJson(Map<String, dynamic> Json) => Droppoint(
    id: Json['id'],
    adress: Json['adress'],
    lat: Json['lat'],
    lon: Json['lon'],
    cmpnyid: Json['cmpnyid']
  );
}