class Device {
  String id;
  String cmpnyid;
  String filelink;
  int qnty;
  String userid;
  String typeid;
  String droppointid;
  String address;
  String phno;
  String status;
  int point;
  String mode;
  Device({
    this.id = "",
    this.cmpnyid = "",
    this.filelink = "",
    this.userid = "",
    this.droppointid = "",
    this.address = "",
    this.phno = "",
    this.status = "",
    this.mode = "",
    this.typeid = "",
    this.qnty = 0,
    this.point = 0,
  });
  Map<String, dynamic> toJson() => {
    'id': id,
    'cmpnyid': cmpnyid,
    'filelink': filelink,
    'userid': userid,
    'droppointid': droppointid,
    'address': address,
    'phno': phno,
    'status': status,
    'mode': mode,
    'typeid': typeid,
    'qnty': qnty,
    'point': point,
  };
  static Device fromJson(Map<String, dynamic> Json) => Device(
    id: Json['id'],
    status: Json['status'],
    point: Json['point'],
    phno: Json['phno'],
    address: Json['address'],
    cmpnyid: Json['cmpnyid'],
    droppointid: Json['droppointid'],
    filelink: Json['filelink'],
    mode: Json['mode'],
    qnty: Json['qnty'],
    typeid: Json['typeid'],
    userid: Json['userid'],
  );
}