// import 'dart:html';

// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:mon_agro/controller/agropad_notifier.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';
import 'package:geocoding/geocoding.dart' hide Location;

import '../main.dart';
import 'dashboard.dart';
import 'meteo.dart';

class MeteoArgs extends BaseArguments {
  final String productName;
  final double price;

  MeteoArgs({
    @required this.productName,
    @required this.price,
  });
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomeState createState() => _HomeState();

  }



  void navigateToDasboard(BuildContext context) {
    Routes.sailor.navigate(
      '/dashboard',
      params: {
        'price': 2000.0,
        'productName': 'Laptop 2nd Gen',
      },
    );
  }

  void navigateToMeteo(BuildContext context) {
    Routes.sailor.navigate(
      '/meteo',
      args: MeteoArgs(
        price: 3000,
        productName: 'Laptop 3rd Gen',
      ),
    );
  }



class _HomeState extends State<Home> {

  //final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    //AgroPadNotifier agroPadNotifier = Provider.of<AgroPadNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Gestion de ma parcelle',
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(

        child: Container(
          color: Colors.green,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            Container(

              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xfff2f3f7),
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(70),
                  bottomRight: const Radius.circular(70),
                ),
              ),
              //mainAxisAlignment: MainAxisAlignment.center,
              child: Column(

                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.wifi, size: 45),
                    title: Text('Travailler avec Internet'),
                    //subtitle: Text('${temperature.pressure}'),
                    //trailing: Icon(Icons.local_bar_rounded),
                  ),
                  ElevatedButton(

                    child: Text(
                      'Continuer',
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: Colors.yellow)
                            )
                        )),
                    onPressed: () => navigateToListAgropad(context),

                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  ListTile(
                    leading: Icon(Icons.wifi_off, size: 45),
                    title: Text('Travailler sans Internet'),
                    //subtitle: Text('${temperature.pressure}'),
                    //trailing: Icon(Icons.local_bar_rounded),
                  ),
                  ElevatedButton(
                    child: Text('Continuer'),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: Colors.yellow)
                            )
                        )),
                    onPressed: () => navigateToMeteo(context),
                  ),
                ],
              ),

            ),



          ]),
        ),
      ),
    );

  }

  navigateToListAgropad(BuildContext context) {

    // if(!_formkey.currentState.validate()) return;
    // _formkey.currentState.save();


    Routes.sailor.navigate(
      '/listagro',
      // params: {
      //   'price': 2000.0,
      //   'productName': 'Laptop 2nd Gen',
      // },
    );

  }


}


