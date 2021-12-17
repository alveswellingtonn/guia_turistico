import 'package:flutter/material.dart';
import 'package:guia_turistico/Tile/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_turistico/screens/Locais.dart';

class Home extends StatelessWidget {

  //final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Guia Turístico"),
       centerTitle: true,
     ),
     //drawer: CustomDrawer(_pageController),
     body: Container(
       child: FutureBuilder<QuerySnapshot>(
         future: Firestore.instance.collection("guia").getDocuments(),
         builder: (context, snapshot) {
           if(!snapshot.hasData)
           return Center(
             child: CircularProgressIndicator(),
           );
           else {
             var dividedTiles = ListTile.divideTiles(
               tiles: snapshot.data.documents.map((doc){
                 return ListTile(
                   leading: CircleAvatar(
                     radius: 25.0,
                     backgroundColor: Colors.transparent,
                     backgroundImage: NetworkImage(doc.data["icon"]),
                   ),
                   title: Text(doc.data["title"]),
                   trailing: Icon(Icons.arrow_forward_ios),
                   onTap: (){
                     Navigator.of(context).push(
                       MaterialPageRoute(builder: (context)=>Locais(doc))
                     );
                   },
                 );
               }).toList(),
               color: Colors.grey[500]).toList();

               return ListView(
                 children: dividedTiles,
               );
           }
         }
       ),
     ),
      //backgroundColor: Colors.blue[50],
    );
  }
}
