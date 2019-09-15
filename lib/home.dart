import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'searchBar.dart';
import 'body.dart';
import 'model/city_model.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => new _Home();
}

List<String> cities = [];

class _Home extends State<Home> {
  Future setCities() async {
    List<CityModel> _cities = const [];
    String content = await rootBundle.loadString('lib/data/city.json');
    List collection = json.decode(content);
    _cities = collection.map((json) => CityModel.fromJson(json)).toList();
    for (CityModel c in _cities) {
      cities.add(c.name);
    }
    setState(() {
      cities = cities;
    });
  }

  void initState() {
    setCities();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Title(color: Colors.white, child: Text("Weather")),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red])),
        child: Column(
          children: <Widget>[SearchBar(),
            Body()
          ],
        ),
      ),
    );
  }
}
