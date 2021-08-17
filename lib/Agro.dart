// To parse this JSON data, do
//
//     final agro = agroFromJson(jsonString);

import 'dart:convert';

List<Agro> agroFromJson(String str) => List<Agro>.from(json.decode(str).map((x) => Agro.fromJson(x)));

String agroToJson(List<Agro> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Agro {
  Agro({
    this.isBusy,
    this.arrayOfCartesId,
    this.id,
    this.nom,
    this.description,
    this.idOrg,
    this.createBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool isBusy;
  List<dynamic> arrayOfCartesId;
  String id;
  String nom;
  String description;
  String idOrg;
  String createBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Agro.fromJson(Map<String, dynamic> json) => Agro(
    isBusy: json["isBusy"],
    arrayOfCartesId: List<dynamic>.from(json["ArrayOfCartesId"].map((x) => x)),
    id: json["_id"],
    nom: json["Nom"],
    description: json["Description"],
    idOrg: json["idOrg"],
    createBy: json["createBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "isBusy": isBusy,
    "ArrayOfCartesId": List<dynamic>.from(arrayOfCartesId.map((x) => x)),
    "_id": id,
    "Nom": nom,
    "Description": description,
    "idOrg": idOrg,
    "createBy": createBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
