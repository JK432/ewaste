class Msg {
  String id;
  String userid;
  String deviceid;
  String cmpnyid;
  String msg;
  Msg({this.id = "", this.userid = "", this.deviceid = "", this.msg = "",this.cmpnyid=""});
  Map<String, dynamic> toJson() => {
    'id': id,
    'userid': userid,
    'deviceid': deviceid,
    'msg': msg,
    'cmpnyid':cmpnyid
  };
  static Msg fromJson(Map<String, dynamic> Json) => Msg(
      id: Json['id'],
      userid: Json['userid'],
      deviceid: Json['deviceid'],
      msg: Json['msg'],
      cmpnyid: Json['cmpnyid']
  );
}