class CastModel {
  int castId = 0;
  String character = "";
  String name = "";

  CastModel({this.castId, this.character, this.name});

  CastModel.fromJson(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this.castId;
    data['character'] = this.character;
    data['name'] = this.name;
    return data;
  }
}
