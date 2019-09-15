import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable(explicitToJson: true)
class Wind{

  final double speed;

  Wind(this.speed);

  factory Wind.fromJson(Map<String, dynamic> json) =>
      _$WindFromJson(json);

}