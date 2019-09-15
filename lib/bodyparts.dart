import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CusText extends StatelessWidget {
  String text;
  MediaQueryData queryData;
  CusText(this.text, this.queryData);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: queryData.size.aspectRatio*30, color: Colors.white),
    );
  }
}

class LoadText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: Colors.black26,
      size: 24.0,
    );
  }
}

class PlaceHolder extends StatelessWidget{
  String s;
  MediaQueryData queryData;
  PlaceHolder(this.s, this.queryData);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(s,style: TextStyle(fontSize: queryData.size.aspectRatio*24, color: Colors.black),),
        LoadText(),
      ],
    );
  }
}

class LoadImg extends StatelessWidget {

  MediaQueryData queryData;
  LoadImg(this.queryData);

  @override
  Widget build(BuildContext context) {
    return SpinKitPulse(
      color: Colors.black26,
      size: queryData.size.aspectRatio*64,
    );
  }
}