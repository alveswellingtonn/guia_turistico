import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);
  @override
  Widget build(BuildContext context) {

    Widget _buildDraweryBack() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 203, 236, 241),
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDraweryBack(),
          
        ],
      ),
    );
  }
}
