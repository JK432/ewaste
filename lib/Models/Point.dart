class Points {
  String id;
  int point;
  String cmpnyid;
  String userid;
  Points({
    this.id = "",
    this.point=0,
    this.cmpnyid="",
    this.userid=""
  });
  Map<String, dynamic> toJson() => {
    'id': id,
    'point': point,
    'cmpnyid': cmpnyid,
    'userid':userid
  };
  static Points fromJson(Map<String, dynamic> Json) => Points(
    id: Json['id'],
    point: Json['point'],
    userid: Json['userid'],
    cmpnyid:Json['cmpnyid']
  );
}




class userPointitem{
  int point;
  userPointitem({this.point =0});
  Map<String, dynamic> toJson() => {
    'point': point,
  };
  static userPointitem fromJson(Map<String, dynamic> Json) => userPointitem(
      point: Json['point'],
  );
}