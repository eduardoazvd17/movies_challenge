class CrewModel {
  String department = "";
  int id = 0;
  String job = "";
  String name = "";

  CrewModel({this.department, this.id, this.job, this.name});

  CrewModel.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    id = json['id'];
    job = json['job'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['id'] = this.id;
    data['job'] = this.job;
    data['name'] = this.name;
    return data;
  }
}
