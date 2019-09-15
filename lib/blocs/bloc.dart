import 'dart:async';

import 'package:flutter/cupertino.dart';

class Bloc extends ChangeNotifier  {

  //weather
  String _weatherMain = "";
  String _weatherDescription = "";

  String get weatherMain => _weatherMain;
  String get weatherDescription => _weatherDescription;

  //main
  String _temp = "";
  String _temp_min = "";
  String _temp_max = "";
  String _humidity = "";
  String _pressure = "";

  String get temp => _temp;
  String get temp_min => _temp_min;
  String get temp_max => _temp_max;
  String get humidity => _humidity;
  String get pressure => _pressure;

  //wind
  //weather
  String _wind = "";

  String get wind => _wind;

  apply(List<String> list){
    print("apply"+list.toString());
    _weatherMain = list[0];
    _weatherDescription = list[1];

    _temp=list[2];
    _temp_min=list[3];
    _temp_max=list[4];
    _humidity=list[5];
    _pressure=list[6];

    _wind=list[7];

    notifyListeners();
  }
}
