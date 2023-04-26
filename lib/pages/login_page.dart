import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
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
                      print("Hi Keshav");
                    },
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
