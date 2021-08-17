import 'package:flutter/material.dart';
import 'package:mon_agro/controller/agropad_notifier.dart';
import 'package:mon_agro/pages/irrigation.dart';
import 'package:mon_agro/pages/login_page.dart';
import 'package:provider/provider.dart';
//import 'package:location/location.dart';
import 'package:sailor/sailor.dart';

import 'pages/home.dart';
import 'pages/dashboard.dart';
import 'pages/meteo.dart';
import 'pages/listagro.dart';

void main() {
  Routes.createRoutes();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AgroPadNotifier()),
      ],
        child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LoginPage(),
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
    );

  }
}



class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: '/home',
        builder: (context, args, params) {
          return Home();
        },
      ),
      SailorRoute(
        name: '/dashboard',
        builder: (context, args, params) {
          return Dashboard(
            // productName: params.param('productName'),
            // price: params.param<double>('price'),
          );
        },
        defaultTransitions: [
          SailorTransition.slide_from_bottom,
          SailorTransition.slide_from_left,
          SailorTransition.zoom_in,
        ],
        defaultTransitionCurve: Curves.bounceInOut,
        defaultTransitionDuration: Duration(seconds: 2),
        params: [
          SailorParam(name: 'productName', isRequired: true),
          SailorParam(name: 'price', defaultValue: 100.0),
        ],
      ),
      SailorRoute(
        name: '/meteo',
        builder: (context, args, params) {
          return Meteo();
        },
        defaultTransitions: [
          SailorTransition.slide_from_bottom,
          SailorTransition.slide_from_left,
          SailorTransition.zoom_in,
        ],
        defaultTransitionCurve: Curves.easeInCirc,
        defaultTransitionDuration: Duration(seconds: 2),
      ),
      SailorRoute(
        name: '/listagro',
        builder: (context, args, params) {
          return Listagro();
        },
        defaultTransitions: [
          SailorTransition.slide_from_bottom,
          SailorTransition.slide_from_left,
          SailorTransition.zoom_in,
        ],
        defaultTransitionCurve: Curves.easeInCirc,
        defaultTransitionDuration: Duration(seconds: 1),
      ),
      SailorRoute(
        name: '/irrigation',
        builder: (context, args, params) {
          return Irrigation();
        },
        defaultTransitions: [
          SailorTransition.slide_from_bottom,
          SailorTransition.slide_from_left,
          SailorTransition.zoom_in,
        ],
        defaultTransitionCurve: Curves.easeInCirc,
        defaultTransitionDuration: Duration(seconds: 1),
      ),
    ]);
  }
}
