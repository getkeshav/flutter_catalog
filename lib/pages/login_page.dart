import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
        child: Column(
      //column has vertical as main axis
      children: [
        Image.asset(
          "assets/images/login_image.png",
          fit: BoxFit.cover, //covers the entire target box cutting the image as less as possible
        ),
      ],
    ));
  }
}
