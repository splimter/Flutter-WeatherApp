import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'home.dart';
import 'model/temp.dart';
import 'model/weather.dart';
import 'model/wind.dart';
import 'blocs/bloc.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBar createState() => new _SearchBar(key);
}

GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
const String API_KEY = "d88ec5e8ed577eb7e09dfb362e00c9c9";

var weather;
List<String> wrapper = [];

class _SearchBar extends State<SearchBar> {
  Bloc bloc = new Bloc();

  AutoCompleteTextField searchTextField;

  _SearchBar(Key key);

  Widget row(String city) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          city,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }

  Future setWeather(city) async {

    List<String> _wrapper = [];

    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$API_KEY");

    String content = response.body;

    print("content: "+content);

    content = content.replaceAll("\"main\":{", "\"main\":[{");
    content = content.replaceAll("},\"visibility\"", "}],\"visibility\"");

    content = content.replaceAll("\"wind\":{", "\"wind\":[{");
    content = content.replaceAll("},\"clouds\"", "}],\"clouds\"");

    print(content);

    var collection = json.decode(content);

    var data =
        collection["weather"].map((json) => Weather.fromJson(json)).toList();

    _wrapper.add(data[0].main);
    _wrapper.add(data[0].description);

    data = collection["main"].map((json) => Temp.fromJson(json)).toList();

    _wrapper.add(data[0].temp.toString());
    _wrapper.add(data[0].temp_min.toString());
    _wrapper.add(data[0].temp_max.toString());
    _wrapper.add(data[0].humidity.toString());
    _wrapper.add(data[0].pressure.toString());

    data = collection["wind"].map((json) => Wind.fromJson(json)).toList();
    _wrapper.add(data[0].speed.toString());

    wrapper = _wrapper;
  }

  @override
  void initState() {
    super.initState();
  }

  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    final blocModel = Provider.of<Bloc>(context);
    queryData = MediaQuery.of(context);

    return Card(
         margin:EdgeInsets.all(15) ,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              searchTextField = AutoCompleteTextField<String>(

                key: key,
                clearOnSubmit: false,
                suggestions: cities,

                style: TextStyle(color: Colors.black, fontSize: 18,),
                decoration: InputDecoration.collapsed(
                  hintText: 'City...',
                  hintStyle: TextStyle(color: Colors.black45, fontSize: 18 ),
                ),

                itemFilter: (item, query) {
                  return item
                      .toLowerCase()
                      .startsWith(query.toLowerCase());
                },
                itemSorter: (a, b) {
                  return a.compareTo(b);
                },
                itemSubmitted: (item) async  {
                  setState(() {
                    searchTextField.textField.controller.text = item;
                  });
                  blocModel.apply(["","","","","","","",""]);
                  await setWeather(item);
                  blocModel.apply(wrapper);
                },
                itemBuilder: (context, item) {
                  // ui for the autocomplete row
                  return row(item);
                },
              ),
            ],
          ),
        ));
  }
}

