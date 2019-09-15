import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true)
class Weather{

  final String main;
  final String description;

  Weather(this.main, this.description);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

}