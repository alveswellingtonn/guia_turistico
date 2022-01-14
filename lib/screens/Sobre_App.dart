import 'package:flutter/material.dart';

class SobreApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre o app"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
            child: Container(
              padding: EdgeInsets.all(6.0),
              height: 300.0,
              width: 200,
              child: Image.asset("assets/icon.png"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(18.0),
            child: Text("O guia Caieiras Tour surgiu com o propósito de reunir o "
                "maior número possível de informações justamente para facilitar "
                "os turistas e além disso divulgar os potenciais e futuros "
                "comércios da região.",
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
