import 'package:json_annotation/json_annotation.dart';

part 'temp.g.dart';

@JsonSerializable(explicitToJson: true)
class Temp{

  final double temp;
  final double temp_min;
  final double temp_max;
  final double pressure;
  final double humidity;

  Temp(this.temp, this.temp_min, this.temp_max, this.pressure, this.humidity);

  factory Temp.fromJson(Map<String, dynamic> json) =>
      _$TempFromJson(json);

}