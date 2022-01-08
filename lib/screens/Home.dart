import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_turistico/main.dart';
import 'package:guia_turistico/screens/Fale_Conosco.dart';
import 'package:guia_turistico/screens/Locais.dart';
import 'package:guia_turistico/screens/Sobre_App.dart';

class Home extends StatelessWidget {

  //final _pageController = PageController();

  Widget _buildDraweryBack() => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF64B5F6),
              Colors.grey[200]
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Guia Turístico"),
       centerTitle: true,
     ),
     drawer: Drawer(
       child: Stack(
         children: <Widget>[
           _buildDraweryBack(),
           ListView(
             children: <Widget>[
               DrawerHeader(
                 padding: EdgeInsets.only(top: 20.0, left: 20.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text("Caieiras Tour",
                       style: TextStyle(
                           fontSize: 34.0, fontWeight: FontWeight.bold
                       ),
                     ),
                     SizedBox(height: 20.0,),
                     Text("Olá, Sejam bem-vindos!",
                       style: TextStyle(
                         fontSize: 18.0, fontWeight: FontWeight.bold
                       ),
                     )
                   ],
                 ),
               ),
               ListTile(
                 leading: Icon(
                   Icons.contact_support_sharp,
                   size: 32.0,
                   color: Colors.grey[700],
                 ),
                 title: Text("Fale Conosco",
                   style: TextStyle(
                     fontSize: 18.0,
                     color: Colors.black
                   ),
                 ),
                 onTap: (){
                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (context)=>FaleConosco())
                   );
                 },
               ),
               ListTile(
                 leading: Icon(
                   Icons.info_sharp,
                   size: 32.0,
                   color: Colors.grey[700],
                 ),
                 title: Text("Sobre o App",
                   style: TextStyle(
                       fontSize: 18.0,
                       color: Colors.black
                   ),
                 ),
                 onTap: (){
                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (context)=>SobreApp())
                   );
                 },
               )
             ],
           )
         ],
       )
     ),
     body: Container(
       child: FutureBuilder<QuerySnapshot>(
         future: Firestore.instance.collection("guia").getDocuments(),
         builder: (context, snapshot) {
           if(!snapshot.hasData)
           return Center(
             child: CircularProgressIndicator(
               color: temaPadrao.primaryColor,
               backgroundColor: temaPadrao.accentColor,
               strokeWidth: 5.0,
             ),
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
      backgroundColor: Colors.grey[200],
    );
  }
}
