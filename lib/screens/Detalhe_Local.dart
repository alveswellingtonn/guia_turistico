import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guia_turistico/datas/product_data.dart';

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
      ),
      body: Container(color: Colors.red,),
    );
  }
}
