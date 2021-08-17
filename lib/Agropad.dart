class Agropad{

  bool isBusy;
  List ArrayOfCartesId;
  String createdAt;
  String updatedAt;
  String _id;
  String Nom;
  String Description;
  String lat;
  String long;
  String idOrg;
  bool active;
  String createdBy;

  Agropad(Map map){
    this._id = map["_id"];
    this.Nom = map["Nom"];
    this.Description = map["Description"];
    this.lat = map["lat"];
    this.long = map["long"];
    this.idOrg = map["idOrg"];
    this.active = map["active"];
    this.createdBy = map["createdBy"];
    this.isBusy = map["isBusy"];
    this.ArrayOfCartesId = map["ArrayOfCartesId"];
    this.createdAt = map["createdAt"];
    this.updatedAt = map["updatedAt"];
  }

}