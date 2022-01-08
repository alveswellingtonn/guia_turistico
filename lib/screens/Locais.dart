import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guia_turistico/datas/product_data.dart';
import 'package:guia_turistico/main.dart';
import 'package:guia_turistico/screens/Detalhe_Local.dart';

class Locais extends StatelessWidget {

  final DocumentSnapshot snapshot;

  Locais( this.snapshot);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(snapshot.documentID),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("guia").document(snapshot.documentID)
        .collection("Items").getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator(
              color: temaPadrao.primaryColor,
              backgroundColor: temaPadrao.accentColor,
              strokeWidth: 5.0,
            ),);
          else
            return ListView.builder(
              padding: EdgeInsets.all(14.0),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){

                ProductData data = ProductData.fromDocument(snapshot.data.documents[index]);
                data.category = this.snapshot.documentID;

                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>DetalheLocal(data))
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shadowColor: temaPadrao.primaryColor,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Image.network(data.images[0],
                            fit: BoxFit.cover,
                            height: 150.0,
                            width: 190.0,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(data.title,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                //Text(data.telefone)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        },
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
