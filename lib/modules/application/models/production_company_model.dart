class ProductionCompanyModel {
  int id;
  String name;

  ProductionCompanyModel({this.id, this.name});

  ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
    };
  }
}
