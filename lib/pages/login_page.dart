import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          // allows screen to scroll so that bottom overflow error doesnt occur when widgets become of higher size
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
                "Welcome $name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    //for effect
                    onTap: () async{
                      setState(() {
                        changeButton = true;  // change button becomes true on ontap and setstate is called again
                      });
                      await Future.delayed(Duration(seconds: 1)); // wait for 1 second after ontap is executed
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changeButton
                          ? 50
                          : 130, //if change button is true do width=50 else 130.
                      alignment: Alignment.center,
                      child: changeButton? Icon(Icons.done,color: Colors.white,): Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          // shape: changeButton?BoxShape.circle:BoxShape.rectangle ,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50  : 8)
                          ),
                    ),
                  )
                  //  ElevatedButton(
                  //     child: Text("Login"),
                  //     style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(
                  //           context,
                  //           MyRoutes
                  //               .homeRoute); //navigate from login page to home page onpressing the button
                  //     },

                  //   ),
                ]),
              ),
            ],
          ),
        ));
  }
}
