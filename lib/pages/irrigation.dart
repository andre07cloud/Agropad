import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class Irrigation extends StatefulWidget {
  @override
  _IrrigationState createState() => _IrrigationState();
}

class _IrrigationState extends State<Irrigation> {
  bool action = false;
  bool des = false;

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'AutoAgro.',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomSwitch(
          activeColor: Colors.pinkAccent,
          value: action,
          onChanged: (value) {
            setState(() {
              action = value;
            });
          },
        ),
        if (!action)
          FlatButton(
            onPressed: () => {
              slideDialog.showSlideDialog(
                context: context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("LISTE DES CAPTEURS"),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text("Activation des Capteurs")),
                  ],
                ),
                backgroundColor: Colors.white,

                // barrierColor: Colors.white.withOpacity(0.7),
                // pillColor: Colors.red,
                // backgroundColor: Colors.yellow,
              )
            },
            child: Text('Mode Manuel'),
            color: Colors.green,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          ),
        if (action)
          FlatButton(
            onPressed: () => {
              slideDialog.showSlideDialog(
                context: context,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Text("LISTE DES CAPTEURS")),
                  ],
                ),
                backgroundColor: Colors.green,

                // barrierColor: Colors.white.withOpacity(0.7),
                // pillColor: Colors.red,
                // backgroundColor: Colors.yellow,
              )
            },
            child: Text('Mode Automatique'),
            color: Colors.green,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Automatique",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 50,
                        ),
                      ),
                    ],
                  ),
                  _buildSocialBtnRow(),
                ],
              ),
            ),
          ),
        ])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ///fond vert
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('IRRIGATION'),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.green,
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xfff2f3f7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
