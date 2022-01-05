import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  /*abrirMap()async{
    const url ="https://www.google.com/maps/place/"
        "Mirante+do+Cristo+de+Caieiras/@-23.3471872"
        ",-46.7562364,14.58z/data=!4m5!3m4!"
        "1s0x94cee35c66fb3b75:0x715a1209b618288!8m2!3d-23."
        "3539925!4d-46.7646759";
      if(await canLaunch(url)){
      await launch(url);
    } else {
      throw "Erro ao abrir o Mapa";
    }
  }*/

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
              dotSize: 5.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: temaPadrao.primaryColor,
              autoplay: false,
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
                          Icon(Icons.phone_in_talk_rounded,
                            size: 55.0,
                            color: temaPadrao.primaryColor,
                          ),
                          SizedBox(height: 5.0,),
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
                          Icon(Icons.location_on,
                            size: 55.0,
                            color: temaPadrao.primaryColor,
                          ),
                          SizedBox(height: 5.0,),
                          Text("Mapa",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                /*ListView(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  children: product.horario.map((h){
                    return Container(
                      child: Text(h),
                    );
                  }).toList(),
                )*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
