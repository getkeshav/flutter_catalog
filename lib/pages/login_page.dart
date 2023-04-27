import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

import '../utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(  // allows screen to scroll so that bottom overflow error doesnt occur when widgets become of higher size
          child: Column(
            //column has vertical as main axis
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit
                    .cover, //covers the entire target box cutting the image as less as possible
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute); //navigate from login page to home page onpressing the button
                      },
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
