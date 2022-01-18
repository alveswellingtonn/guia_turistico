import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:guia_turistico/datas/product_data.dart';
import 'package:guia_turistico/main.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalheLocal extends StatefulWidget {

  final ProductData product;

  DetalheLocal(this.product);

  @override
  _DetalheLocalState createState() => _DetalheLocalState(product);
}

class _DetalheLocalState extends State<DetalheLocal> {

  final ProductData product;

  _DetalheLocalState (this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
            child: Carousel(
              images: product.images.map((url){
                return NetworkImage(url);
              }).toList(),
              dotSize: 7.0,
              dotSpacing: 20.0,
              dotBgColor: Colors.transparent,
              dotColor: Colors.white,
              autoplay: false,
              dotIncreasedColor: temaPadrao.primaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Sobre o Local",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                  ),
                  maxLines: 3,
                ),
                SizedBox(height:15.0,),
                Text(
                  product.sobre,
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                ),
                SizedBox(height:20.0,),
                Text(
                  "Endereço",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height:15.0,),
                Text(product.endereco,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height:20.0,),
                Text(
                  "Telefone",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height:15.0,),
                Text(product.telefone,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height:30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        launch("tel:${product.telefone}");
                      },
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF0D47A1),
                            radius: 35.0,
                            child: Icon(
                              Icons.phone_in_talk_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:10.0),
                          ),
                          Text("Telefone",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        launch("https://www.google.com/maps/search/?api=1&query=${product.lat},"
                            "${product.long}");
                      },
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF0D47A1),
                            radius: 35.0,
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:10.0),
                          ),
                          Text("Mapa",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      )

                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
