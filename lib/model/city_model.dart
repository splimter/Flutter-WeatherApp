import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel{

  final String name;

  CityModel(this.name);

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

}
