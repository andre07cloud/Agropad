import 'dart:convert';

//import 'package:agropadprojet/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'home.dart';

//import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

///function for server Api
class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool _isLoading = false;

  signIn(String email, String pass) async {
    final url = Uri.https(
        'http://localhost:1996', '/sabsab/user/login', {'q': '{http}'});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email": email, "password": pass};
    var jsonResponse;
    var res = await http.post(url, body: body);

    //Need to check the api status
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);

      print("Response status: ${res.statusCode}");
      print("Response Status: ${res.body}");

      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Home()),
                (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print("Response status: ${res.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Login",
                style: TextStyle(fontSize: 45, color: Colors.greenAccent)),
            SizedBox(height: 46),
            Card(
              elevation: 5.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(7.5)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: _passController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width/2,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.yellow)
                          )
                      )),

                      onPressed: () => goToHome(context),
                  child: Text('Connexion',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),),
                )
            )],
        ),
      ),
    );
  }

  goToHome(BuildContext context) {

    Routes.sailor.navigate(
      '/home',
      // params: {
      //   'price': 2000.0,
      //   'productName': 'Laptop 2nd Gen',
      // },
    );
  }
}
