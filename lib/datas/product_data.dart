import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {

  String category;

  String id;
  String title;
  String endereco;
  String telefone;

  String sobre;

  List images;
  List horario;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    endereco = snapshot.data["endereco"];
    telefone = snapshot.data["telefone"];
    sobre = snapshot.data["sobre"];
    images = snapshot.data["images"];
    horario = snapshot.data["horario"];
  }
}
