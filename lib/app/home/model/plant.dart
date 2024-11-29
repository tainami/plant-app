class PlantModel {
  final String name;
  final String image;
  final String specie;
  final int watering;

  PlantModel(this.name, this.image, this.specie, this.watering);


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'specie': specie,
      'watering': watering,
    };
  }

  factory PlantModel.fromMap(Map<String, dynamic> data) {
    return PlantModel(
      data['name'],
      data['image'],
      data['specie'],
      data['watering'],
    );
  }
}