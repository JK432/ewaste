
class Cmpny {
  String id;
  String name;
  String url;
  String email;
  String privacypolicy;
  String imgurl;
  Cmpny({
    this.id = "",
    this.name = "",
    this.url = "",
    this.email = "",
    this.imgurl = "",
    this.privacypolicy = "",
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'url': url,
        'email': email,
        'imgurl': imgurl,
        'privacypolicy': privacypolicy,
      };
  static Cmpny fromJson(Map<String, dynamic> Json) =>
      Cmpny(
          id: Json['id'],
          name: Json['name'],
          url: Json['url'],
          email: Json['email'],
          imgurl: Json['imgurl'],
          privacypolicy: Json['privacypolicy']
      );
}


class Cmpnyid {
  String cmpnyid;
  Cmpnyid({
    this.cmpnyid = "",

  });
  Map<String, dynamic> toJson() => {
    'cmpnyid': cmpnyid,
  };
  static Cmpnyid fromJson(Map<String, dynamic> Json) =>
      Cmpnyid(
          cmpnyid:Json['cmpnyid'],
      );
}