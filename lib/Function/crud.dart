//Add type class

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewaste/Function/auth.dart';
import 'package:ewaste/Models/MessageModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Models/Cmpny.dart';
import '../Models/Point.dart';
import '../Widget/snackbar.dart';
import '../Models/Droppoint.dart';
import '../Models/DeviceType.dart';
import '../Models/Device.dart';




///Device model



///Addtype function
addType(String type, String cid, BuildContext context) async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final t = FirebaseFirestore.instance.collection("type").doc(id);
  final t2 = Type(cmpnyid:cid, type: type, id: id);
  final json = t2.toJson();
  await t.set(json).then((value) => {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarSucess("Added"))
      });
}

///Add Drop_point
addPoint(String adress, String lat, String lon, String cid, BuildContext context) async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final t = FirebaseFirestore.instance.collection("droppoint").doc(id);
  final t2 = Droppoint(
    id: id,
    adress: adress,
    lat: lat,
    lon: lon,
    cmpnyid: cid,
  );
  final json = t2.toJson();
  await t.set(json).then((value) => {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarSucess("Added"))
      });
}


///Add Point for user company
addUserCompanyPoint(Device device,String cid, String did,BuildContext context,int point) async {

  await FirebaseFirestore.instance.collection("points").doc(device.userid).collection('cmpny').doc(cid).set({'cmpnyid':cid,}).then((value)async{
    final t = FirebaseFirestore.instance.collection("points").doc(device.userid).collection('cmpny').doc(cid).collection('devices').doc(did);
    final t2 = userPointitem(
      point: point,
    );
    final json = t2.toJson();
    await t.set(json).then((value)async{
      final FI2 = FirebaseFirestore.instance.collection("devices").doc(device.id);
      final d= Device(point:point ,userid:device.userid ,id:device.id,cmpnyid:device.cmpnyid ,status:'Approved',address:device.address ,droppointid: device.droppointid, filelink:device.filelink ,mode:device.mode ,qnty:device.qnty ,typeid:device.typeid ,phno:device.phno );
      final json = d.toJson();
      await FI2.update(json).then((value)  {

        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarSucess("Alocated"));


      });
    });

  });


}


///AddCmpny function
addCmpny(String name, String url, BuildContext context) async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final c = FirebaseFirestore.instance.collection("cmpny").doc(id);
  final c1 = Cmpny(name: name, url: url, id: id);
  final json = c1.toJson();
  await c.set(json).then((value) => {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarSucess("Company Added"))
      });
}

///AddDevice function
addDevice(
    {
    required String cmpnyid,
    required String filelink,
    required int qnty,
    required String userid,
    required String typeid,
    required String droppointid,
    required String address,
    required String phno,
    required String status,
    required int point,
    required String mode,
    required BuildContext context}) async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final Finstance = FirebaseFirestore.instance.collection("devices").doc(id);
  final device = Device(
    userid: userid,
    typeid: typeid,
    qnty: qnty,
    mode: mode,
    filelink: filelink,
    droppointid: droppointid,
    cmpnyid: cmpnyid,
    address: address,
    phno: phno,
    point: point,
    status: status,
    id: id,
  );
  final json = device.toJson();
  await Finstance.set(json).then((value) => {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarSucess("Device Added"))
      });
}
///Stream Device
Stream<List<Device>> readDevice() => FirebaseFirestore.instance
    .collection('devices')
    .where('mode',isNotEqualTo: 'Claim').where('userid',isEqualTo: Authentication().userData().uid)
    .snapshots()
    .map((snaphot) =>
    snaphot.docs.map((doc) => Device.fromJson(doc.data())).toList());


///Stream Claim Device
Stream<List<Device>> readClaimDevice() => FirebaseFirestore.instance
    .collection('devices')
    .where('mode',isEqualTo: 'Claim').where('userid',isEqualTo: Authentication().userData().uid)
    .snapshots()
    .map((snaphot) =>
    snaphot.docs.map((doc) => Device.fromJson(doc.data())).toList());



///Stream Company from point
Stream<List<Cmpnyid>> readcompanypointsforUser() => FirebaseFirestore.instance
    .collection('points').doc(Authentication().userData().uid).collection('cmpny')
    .snapshots()
    .map((snaphot) =>
    snaphot.docs.map((doc) => Cmpnyid.fromJson(doc.data())).toList());



///Stream list of pointsdevice
Stream<List<userPointitem>> readpointlistDevice(String cid) => FirebaseFirestore.instance
    .collection('points').doc(Authentication().userData().uid).collection('cmpny').doc(cid).collection('devices')
    .snapshots()
    .map((snaphot) =>
    snaphot.docs.map((doc) => userPointitem.fromJson(doc.data())).toList());


///Stream Device with cmpnyid and userid
Stream<List<Device>> readUserampnyDevice(String cid) => FirebaseFirestore.instance
    .collection('devices')
    .where('mode',isNotEqualTo: 'Claim').where('userid',isEqualTo: Authentication().userData().uid).where('cmpnyid',isEqualTo: cid)
    .snapshots()
    .map((snaphot) =>
    snaphot.docs.map((doc) => Device.fromJson(doc.data())).toList());

///Stream Single Device
Stream<Device> readonedevice(String id) =>
    FirebaseFirestore.instance
        .collection('devices')
        .doc(id).snapshots().map((snapshot) => Device.fromJson(snapshot.data()!));


///Stream Single Cmpny
Stream<Cmpny> readonecmpny(String id) =>
    FirebaseFirestore.instance
        .collection('cmpny')
        .doc(id).snapshots().map((snapshot) => Cmpny.fromJson(snapshot.data()!));

///Stream Device for a company
Stream<List<Device>> readDeviceforCmpny(String cid) => FirebaseFirestore.instance
    .collection('devices')
    .where("cmpnyid",isEqualTo: cid).where("mode",isNotEqualTo: "Claim")
    .snapshots()
    .map((snaphot) =>
    snaphot.docs.map((doc) => Device.fromJson(doc.data())).toList());




///Stream Claim for a company
Stream<List<Device>> readDeviceforCmpnyClaim(String cid) => FirebaseFirestore.instance
    .collection('devices')
    .where("cmpnyid",isEqualTo: cid).where("mode",isEqualTo: 'Claim')
    .snapshots()
    .map((snaphot) =>
    snaphot.docs.map((doc) => Device.fromJson(doc.data())).toList());


///Stream type
Stream<List<Type>> readType(String cid) => FirebaseFirestore.instance
    .collection('type')
    .orderBy("id", descending: true).where('cmpnyid',isEqualTo: cid)
    .snapshots()
    .map((snaphot) =>
        snaphot.docs.map((doc) => Type.fromJson(doc.data())).toList());

///Stream Cmpny
Stream<List<Cmpny>> readCmpny() => FirebaseFirestore.instance
    .collection('cmpny')
    .orderBy("id", descending: true)
    .snapshots()
    .map((snaphot) =>
        snaphot.docs.map((doc) => Cmpny.fromJson(doc.data())).toList());

///Stream droppoint
Stream<List<Droppoint>> readDreoppoint() => FirebaseFirestore.instance
    .collection('droppoint')
    .orderBy("id", descending: true)
    .snapshots()
    .map((snaphot) =>
        snaphot.docs.map((doc) => Droppoint.fromJson(doc.data())).toList());


///Stream droppoint for a cmnpy
Stream<List<Droppoint>> readDroppointcmpny(String cid) => FirebaseFirestore.instance
    .collection('droppoint')
    .orderBy("id", descending: true).where('cmpnyid',isEqualTo: cid)
    .snapshots()
    .map((snaphot) =>
    snaphot.docs.map((doc) => Droppoint.fromJson(doc.data())).toList());


///Stream message for company
Stream<List<Msg>> readmessage(String did) => FirebaseFirestore.instance
    .collection('message')
    .orderBy("id", descending: true).where('deviceid',isEqualTo: did)
    .snapshots()
    .map((snaphot) =>
    snaphot.docs.map((doc) => Msg.fromJson(doc.data())).toList());


///deleteType
deletetype(String id, BuildContext context) async {
  await FirebaseFirestore.instance.collection('type').doc(id).delete().then(
      (value) => {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackbar().snackBarSucess("Deleted"))
          });
}

///deleteCmpny
deleteCmpny(String id, BuildContext context) async {
  await FirebaseFirestore.instance.collection('cmpny').doc(id).delete().then(
      (value) => {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackbar().snackBarSucess("Deleted"))
          });
}

///Droppoint delete
deleteDroppoint(String id, BuildContext context) async {
  await FirebaseFirestore.instance
      .collection('droppoint')
      .doc(id)
      .delete()
      .then((value) => {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackbar().snackBarSucess("Deleted"))
          });
}

///updatetype
updatetype(String id, String type, String cid, BuildContext context) async {
  final t = FirebaseFirestore.instance.collection("type").doc(id);
  final t2 = Type(cmpnyid:cid, type: type, id: id);
  final json = t2.toJson();
  await t.update(json).then((value) => {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarSucess("Updated"))
      });
}

///updatecompany
updatecmpny(String id, String name, String url, String policy, String imgurl,String email, BuildContext context) async {
  final c = FirebaseFirestore.instance.collection("cmpny").doc(id);
  final c1 = Cmpny(id: id, name: name, url: url,privacypolicy:policy ,imgurl:imgurl ,email:email);
  final json = c1.toJson();
  await c.update(json).then((value) => {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarSucess("Updated"))
      });
}

///update droppoint
updatedroppoint(String id, String adress, String lat, String lon,
    BuildContext context) async {
  final c = FirebaseFirestore.instance.collection("droppoint").doc(id);
  final c1 = Droppoint(id: id, adress: adress, lat: lat, lon: lon);
  final json = c1.toJson();
  await c.update(json).then((value) => {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarSucess("Updated"))
      });
}

///Update status of a device
updatestatus(Device device, String status,BuildContext context,String msg) async {
  final t = FirebaseFirestore.instance.collection("devices").doc(device.id);
  final d1 = Device(cmpnyid:device.cmpnyid ,id:device.id  ,userid: device.userid ,phno:device.phno  ,typeid:device.typeid  ,qnty:device.qnty  ,mode:device.mode,filelink:device.filelink  ,droppointid:device.droppointid  ,address: device.address ,point:device.point  ,status:status,);
  final json = d1.toJson();
  await t.update(json).then((value) async {
    await addmessage(device,msg,context);
  });
}
///adding user message
addmessage(Device device,String message,BuildContext context)async{
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final FI = FirebaseFirestore.instance.collection("message").doc(id);
  final msg = Msg(userid:device.userid ,id: id,cmpnyid:device.cmpnyid ,deviceid:device.id ,msg: message);
  final json = msg.toJson();
  await FI.set(json).then((value) => {
  });
}
///adding point to the device
addpoint(Device device,int points,BuildContext context)async{
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final FI = FirebaseFirestore.instance.collection("points").doc(id);
  final dp = Points(cmpnyid:device.cmpnyid,id:id ,userid:device.userid ,point:points,);
  final json = dp.toJson();
  await FI.set(json).then((value)async{
    final FI2 = FirebaseFirestore.instance.collection("devices").doc(device.id);
  final d= Device(point:points ,userid:device.userid ,id:device.id,cmpnyid:device.cmpnyid ,status:'Approved',address:device.address ,droppointid: device.droppointid, filelink:device.filelink ,mode:device.mode ,qnty:device.qnty ,typeid:device.typeid ,phno:device.phno );
  final json = d.toJson();
  await FI2.update(json).then((value)  {

  ScaffoldMessenger.of(context)
      .showSnackBar(snackbar().snackBarSucess("Alocated"));


  });
});
      }
///future list for type
Future<List<Type>> readtype(String cid) async {
  final typeStream = FirebaseFirestore.instance
      .collection('type').where('cmpnyid',isEqualTo: cid)
      .orderBy("id", descending: true)
      .snapshots();
  final typeList = await typeStream.first;
  return typeList.docs.map((doc) => Type.fromJson(doc.data())).toList();
}

///future list for cmpny
Future<List<Cmpny>> readcmpny() async {
  final cmpnyStream = FirebaseFirestore.instance
      .collection('cmpny')
      .orderBy("id", descending: true)
      .snapshots();
  final cmpnyList = await cmpnyStream.first;
  return cmpnyList.docs.map((doc) => Cmpny.fromJson(doc.data())).toList();
}
///Future read one company with id
Future<Cmpny> readOnecmpny(String cid) async {
  Cmpny cmpny =Cmpny();
  final snapshot = await FirebaseFirestore.instance
      .collection('cmpny')
      .doc(cid).get();
  cmpny = Cmpny.fromJson(snapshot.data()!);
  return cmpny;
}

///future list for droppoint
Future<List<Droppoint>> readdroppoint(String cid) async {
  final dropStream = FirebaseFirestore.instance
      .collection('droppoint').where('cmpnyid',isEqualTo: cid)
      .orderBy("id", descending: true)
      .snapshots();
  final dropList = await dropStream.first;
  // print(typeList.docs.map((doc) => Type.fromJson(doc.data())).toList());
  return dropList.docs.map((doc) => Droppoint.fromJson(doc.data())).toList();
}
///Read drop point for a comapy
Future<List<Droppoint>> readdroppointcmpny(String cid) async {
  final dropStream = FirebaseFirestore.instance
      .collection('droppoint')
      .orderBy("id", descending: true).where('cmpnyid',isEqualTo: cid)
      .snapshots();
  final dropList = await dropStream.first;
  // print(typeList.docs.map((doc) => Type.fromJson(doc.data())).toList());
  return dropList.docs.map((doc) => Droppoint.fromJson(doc.data())).toList();
}

///future upload doc
Future<String> uploaddoc(Uint8List file, String filename, BuildContext context) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref = storage.ref().child('wddoc/' + filename + '.pdf');
  await ref.putData(file).then((p0) => {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarSucess("Updated"))
      });
  return await ref.getDownloadURL();
}

///droppintmap
Future<void> openMap(
    String latitude, String longitude, BuildContext context) async {
  Uri googleUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=' +
      latitude +
      ',' +
      longitude);
  if (await canLaunchUrl(googleUrl)) {
    await launchUrl(googleUrl);
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(snackbar().snackBarSucess("Cant open"));
  }
}
// ///read single Company
// Future<Cmpny> readOnecmpny(String id) async {
//   Cmpny company = Cmpny();
//   final snapshot = await FirebaseFirestore.instance
//       .collection('cmpny')
//       .doc(id).get();
//   company = Cmpny.fromJson(snapshot.data()!);
//   return company;
// }

///read single Droppoint
Future<Droppoint> readOnedroppoint(String id) async {
  Droppoint point = Droppoint();
  final snapshot = await FirebaseFirestore.instance
      .collection('droppoint')
      .doc(id).get();
  point = Droppoint.fromJson(snapshot.data()!);
  return point;
}

///read single Type
Future<Type> readOnedtype(String id) async {
  Type type = Type();
  final snapshot = await FirebaseFirestore.instance
      .collection('type')
      .doc(id).get();
  type = Type.fromJson(snapshot.data()!);
  return type;
}
