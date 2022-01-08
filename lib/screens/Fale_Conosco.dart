import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guia_turistico/main.dart';

class FaleConosco extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fale Conosco"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                     Text("wellingtonn.941021@gmail.com"),
                     Icon(Icons.email_sharp),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Telefone: (11) 97552-6178"),
                  Icon(Icons.local_phone),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("R: José Dias de Moraes, V. Pinheiros, Caieiras - SP"),
                  Icon(Icons.location_on_sharp),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text("O guia Caieiras Tour está sempre sujeito as "
                      "atualizções, caso o estabelecimento ou o local não "
                      "esteja cadastrado no guia é só informar!"),
                  SizedBox(height: 12.0,),
                  Text("Para informar e cadastrar no guia é só clicar no botão abaixo!"),
                  SizedBox(height: 36.0,),
                  Positioned(
                    left: 16,
                      right: 16,
                    bottom: 16,
                    child: GestureDetector(
                      child: Container(
                        child: Text("Realizar cadastro",
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
                      onTap: (){},
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
