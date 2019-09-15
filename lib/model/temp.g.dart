// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temp _$TempFromJson(Map<String, dynamic> json) {
  return Temp(
      (json['temp'] as num)?.toDouble(),
      (json['temp_min'] as num)?.toDouble(),
      (json['temp_max'] as num)?.toDouble(),
      (json['pressure'] as num)?.toDouble(),
      (json['humidity'] as num)?.toDouble());
}

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity
    };
