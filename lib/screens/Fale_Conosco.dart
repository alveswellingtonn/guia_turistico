import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guia_turistico/main.dart';
import 'package:url_launcher/url_launcher.dart';

class FaleConosco extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fale Conosco"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                     Text(
                       "caieirastours@gmail.com",
                       style: TextStyle(
                         fontSize: 16.0,
                       ),
                     ),
                     Icon(
                       Icons.email_sharp,
                       size: 29.0,
                       color: Colors.orange[500],
                     ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Telefone: (11) 97552-6178",
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                  Icon(
                      Icons.local_phone,
                    size: 30.0,
                    color: Colors.green[600],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "R: José Dias de Moraes, Caieiras",
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                  Icon(
                      Icons.location_on_sharp,
                    size: 30.0,
                    color: Colors.red[600],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text("O guia Caieiras Tour está sempre sujeito as "
                      "atualizações, caso a empresa ou o local turístico não "
                      "esteja cadastrado no guia Caieiras Tour, é só realizar "
                      "o cadastro, que o mais breve possível estará atualizado no aplicativo",
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                  SizedBox(height: 12.0,),
                  Text("Para informar e cadastrar no guia Caieiras Tour é só "
                      "clicar no botão abaixo e prencher o formulário.",
                    style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 36.0,),
                  Container(
                    child: GestureDetector(
                      child: Container(
                        child: Text("Realizar Cadastro",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: temaPadrao.primaryColor,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      onTap: (){
                        launch("https://docs.google.com/forms/d/e/"
                            "1FAIpQLSeJr5N-Z5ib2k8U7gLt5z56NpJBcHgyTPWu1FZk1KaIQC7-Xw/"
                            "viewform?usp=sf_link");
                      },
                    ),
                  )
                ],
              )
            )
          ],
        )
      ),
    );
  }
}
