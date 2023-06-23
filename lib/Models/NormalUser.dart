class Uuser {
  String uid;
  String roll;
  String total;
  Uuser({
    this.uid = "",
    this.roll ="",
    this.total = "",
  });
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'roll': roll,
    'total': total,
  };
  static Uuser fromJson(Map<String, dynamic> Json) => Uuser(
    uid: Json['uid'],
    roll: Json['roll'],
    total: Json['total'],
  );
}