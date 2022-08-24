class PlantsModel {
  String? type;
  String? message;
  List<PlantData>? data;

  PlantsModel({this.type, this.message, this.data});

  PlantsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PlantData>[];
      json['data'].forEach((v) {
        data!.add(PlantData.fromJson(v));
      });
    }
  }

}

class PlantData {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  PlantData(
      {this.plantId,
        this.name,
        this.description,
        this.imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature});

  PlantData.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = 'https://lavie.orangedigitalcenteregypt.com${json['imageUrl']}';
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }
}
