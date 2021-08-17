import 'package:flutter/material.dart';
import 'package:mon_agro/Agropad.dart';
import 'package:sailor/sailor.dart';

import '../main.dart';
import 'meteo.dart';

// class MeteoArgs extends BaseArguments {
//   final String productName;
//   final double price;
//
//   MeteoArgs({
//     @required this.productName,
//     @required this.price,
//   });
// }

class Dashboard extends StatefulWidget {

  final Agropad agropad;

  //final AgroPadSnapshot agroPadSnapshot;

  Dashboard({this.agropad}) ;

  @override
  _DashboardSate  createState() => _DashboardSate();
}

class _DashboardSate extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' AGROPAD ${widget.agropad.Nom}' ),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Card(


                elevation: 20.0,
                color: Colors.greenAccent,
            child: InkWell(
              onTap: () =>goToIrrigation(context),
              child: Center(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset('../../images/baro.jpg',
                      fit: BoxFit.scaleDown),
                  Text("IRRIGUER VOTRE CHAMP", style: new TextStyle(fontSize: 17.0, color: Colors.white),)
                ],
              ),
            ),
          ),
            ),
            Card(
                elevation: 18.0,
                color: Colors.redAccent,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      //color: Colors.amber[600],
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset('images/pompe.jpg',
                          fit: BoxFit.scaleDown),
                    ),
                    Text(
                      'FILTRER VOTRE CHAMP',
                      textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                )),
            Card(
              elevation: 16.0,
              color: Colors.black45,
              child: InkWell(
                onTap: () =>navigateToMeteo(context),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('../../images/pompe.jpg',
                          fit: BoxFit.scaleDown),
                      Text("DONNEES DE METEO", style: new TextStyle(fontSize: 17.0, color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
                elevation: 14.0,
                color: Colors.blueGrey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      //color: Colors.amber[600],
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset('images/pompe.jpg',
                          fit: BoxFit.scaleDown),
                    ),
                    Text(
                      'RECEVEZ LES CONSEILS DE CROISSANCE DES CULTURES',
                      textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                )),
            Card(
                elevation: 12.0,
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      //color: Colors.amber[600],
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset('images/pompe.jpg',
                          fit: BoxFit.scaleDown),
                    ),
                    Text(
                      'PAIEMENT',
                      textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                )),
            Card(
                elevation: 10.0,
                color: Colors.pinkAccent,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      //color: Colors.amber[600],
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset('../../images/pompe.jpg',
                          fit: BoxFit.scaleDown),
                    ),
                    Text(
                      'ETAT DES CAPTEURS',
                      textAlign: TextAlign.center,

                      //overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                )),
          ],
        ),
      ),
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

  goToIrrigation(BuildContext context) {
    Routes.sailor.navigate(
      '/irrigation',
      // params: {
      //   'price': 2000.0,
      //   'productName': 'Laptop 2nd Gen',
      // },
    );
  }

}
