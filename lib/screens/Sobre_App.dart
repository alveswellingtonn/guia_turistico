import 'package:flutter/material.dart';

class SobreApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre o app"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            height: 350.0,
            width: 250,
            child: Image.asset("assets/gps.png"),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text("O guia Caieiras Tour surgiu com o propósito de reunir o"
                " maior número possível de informações justamente para facilitar"
                " os turistas e além disso divulgar os potenciais e futuros "
                "comércios da região."),
          )
        ],
      ),
    );
  }
}
