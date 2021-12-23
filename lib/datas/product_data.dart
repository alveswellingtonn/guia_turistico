import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {

  String category;

  String id;
  String title;
  String endereco;
  String telefone;

  double lat;
  double long;
  //String local;
  //String localizacao;
  //String phone;
  //String funcionamento;

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
    lat = snapshot.data["lat"];
    long = snapshot.data["long"];
    //local = snapshot.data["local"];
    //localizacao = snapshot.data["localizacao"];
    //phone = snapshot.data["phone"];
    //funcionamento = snapshot.data["funcionamento"];
  }
}
