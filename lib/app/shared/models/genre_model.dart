class GenreModel {
  int id;
  String name;

  GenreModel({this.id, this.name});

  GenreModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJSON() {
    return {
      "id": this.id,
      "name": this.name,
    };
  }
}
