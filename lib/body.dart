import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/bloc.dart';
import 'bodyparts.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  BodyState createState() => new BodyState();
}

class BodyState extends State<Body> {
  String assets;
  MediaQueryData queryData;

  Widget build(BuildContext context) {
    final blocModel = Provider.of<Bloc>(context);
    queryData = MediaQuery.of(context);

    switch (blocModel.weatherMain) {
      case "Clouds":
        setState(() {
          assets = "img/clouds.png";
        });
        break;
      case "Clear":
        setState(() {
          assets = "img/clear.png";
        });
        break;
      case "Rain":
        setState(() {
          assets = "img/rain.png";
        });
        break;
      case "Thunderstorm":
        setState(() {
          assets = "img/thunder.png";
        });
        break;
      case "Snow":
        setState(() {
          assets = "img/snow.png";
        });
        break;
      case "Drizzle":
        setState(() {
          assets = "img/drizzle.png";
        });
        break;
      default:
        setState(() {
          assets = "";
        });
        break;
    }

    var bgColors = [];
    if (blocModel.temp == "") {
      setState(() {
        bgColors.add(Colors.white);
        bgColors.add(Colors.white30);
      });
    } else if (double.parse(blocModel.temp) < 15.0) {
      setState(() {
        bgColors.add(Colors.blue[300]);
        bgColors.add(Colors.blue);
      });
    } else if (double.parse(blocModel.temp) < 25.0) {
      setState(() {
        bgColors.add(Colors.yellow);
        bgColors.add(Colors.yellow[800]);
      });
    } else if (double.parse(blocModel.temp) < 40.0) {
      setState(() {
        bgColors.add(Colors.orange);
        bgColors.add(Colors.orange[800]);
      });
    } else {
      setState(() {
        bgColors.add(Colors.red);
        bgColors.add(Colors.red[800]);
      });
    }

    return Container(
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          child: Container(
            child: Card(
              elevation: 12,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [bgColors[0], bgColors[1]])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    assets == "" ? LoadImg(queryData) : Image.asset(assets),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        blocModel.weatherDescription == ""
                            ? LoadText()
                            : CusText(blocModel.weatherDescription,queryData),
                      ],
                    ),
                    Divider(
                      thickness: queryData.size.aspectRatio*10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Image.asset("img/temp.png",scale: queryData.size.aspectRatio*2,),
                            Row(
                              children: <Widget>[
                                blocModel.temp == ""
                                    ? PlaceHolder("Current: ",queryData)
                                    : CusText("Current: " + blocModel.temp,queryData),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                blocModel.temp_min == ""
                                    ? PlaceHolder("Min: ",queryData)
                                    : CusText("Min: " + blocModel.temp_min,queryData),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        340),
                                blocModel.temp_max == ""
                                    ? PlaceHolder("Max: ",queryData)
                                    : CusText("Max: " + blocModel.temp_max,queryData),
                              ],
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: queryData.size.aspectRatio*10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("img/humidity.png",scale: queryData.size.aspectRatio*2,),
                        blocModel.humidity == ""
                            ? PlaceHolder("Humidity: ",queryData)
                            : CusText("Humidity: " + blocModel.humidity +" %",queryData),
                      ],
                    ),
                    Divider(
                      thickness: queryData.size.aspectRatio*10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("img/pressure.png",scale: queryData.size.aspectRatio*2,),
                        blocModel.pressure == ""
                            ? PlaceHolder("Pressure: ",queryData)
                            : CusText("Pressure: " + blocModel.pressure +" hPa",queryData),
                      ],
                    ),
                    Divider(
                      thickness: queryData.size.aspectRatio*10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("img/wind.png",scale: queryData.size.aspectRatio*2,),
                        blocModel.pressure == ""
                            ? PlaceHolder("Wind: ",queryData)
                            : CusText("Wind: " + blocModel.wind +" m/s",queryData),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
