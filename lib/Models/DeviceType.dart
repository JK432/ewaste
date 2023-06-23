
class Type {
  String id;
  String type;
  String cmpnyid;
  Type({this.id = "", this.type = "", this.cmpnyid=""});
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'cmpnyid': cmpnyid,
  };
  static Type fromJson(Map<String, dynamic> Json) =>
      Type(id: Json['id'], type: Json['type'], cmpnyid: Json['cmpnyid']);
}