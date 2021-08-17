
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location ;
import 'package:location/location.dart';
import 'package:mon_agro/Agropad.dart';
import 'package:sailor/sailor.dart';
import 'package:http/http.dart' as http;

import '../Temperature.dart';

class MeteoArgs extends BaseArguments {
  final String productName;
  final double price;

  MeteoArgs({
    @required this.productName,
    @required this.price,
  });
}

class Meteo extends StatefulWidget {


  Meteo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MeteoState createState() => _MeteoState();

 // final MeteoArgs args;

 // Meteo(this.args);
}

class _MeteoState extends State<Meteo> {


  Location location;
  LocationData locationData;
  Stream<LocationData> stream;
  Temperature temperature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DONNEES DE LA METEO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Card(
              elevation: 15.0,
              child: ListTile(
                tileColor: Colors.blueGrey,
                leading: Image.asset('../images/baro.jpg',
                    fit: BoxFit.scaleDown),
                title: Text('TEMPERATURE'),
                subtitle: Text('${temperature.temp}'),
                trailing: Icon(Icons.device_thermostat),
              ),
            ),

            Card(
              elevation: 15.0,
              child: ListTile(
                leading: Image.asset('../images/baro.jpg',
                    fit: BoxFit.scaleDown),
                title: Text('PRESSION'),
                subtitle: Text('${temperature.pressure}'),
                trailing: Icon(Icons.local_bar_rounded),
              ),
            ),
            Card(
              elevation: 15.0,
              child: ListTile(
                tileColor: Colors.grey,
                leading: Image.asset('../images/baro.jpg',
                    fit: BoxFit.scaleDown),
                title: Text('HUMIDITE'),
                subtitle: Text('${temperature.humidity}'),
                trailing: Icon(Icons.water_damage_outlined),
              ),
            ),
            Card(
              elevation: 15.0,
              child: ListTile(
                leading: Image.asset('../images/baro.jpg',
                    fit: BoxFit.scaleDown),
                title: Text('TEMPERATURE MINIMALE'),
                subtitle: Text('${temperature.min}'),
                trailing: Icon(Icons.wb_sunny_outlined),
              ),
            ),
            Card(
              elevation: 15.0,
              child: ListTile(
                tileColor: Colors.black12,
                leading: Image.asset('../images/baro.jpg',
                    fit: BoxFit.scaleDown),
                title: Text('TEMPS FAIT'),
                subtitle: Text('${temperature.main}'),
                trailing: Icon(Icons.wb_twighlight),
              ),
            ),
            Image.asset('../../images/baro.jpg',
                fit: BoxFit.scaleDown),
            /*Text(
             args.productName,
              style: Theme.of(context).textTheme.display2,
            ),
            Text(
              args.price.toString(),
              style: Theme.of(context).textTheme.display1,
            )*/
          ],
        ),
      ),
    );

}

  @override
  void initState() {
    super.initState();
    location = new Location();

    print("Bonnnnnnnnnnnnnnnnnnnnnnjouuuuuuuuuuuuuurrrrrrr");
    getFirstLocation();
  }

  void getFirstLocation() async{
    try {
      locationData = await location.getLocation();
      print("Nouvelle position: ${locationData.latitude} / ${locationData
          .longitude}");
      locationToString();

    } catch (e) {
      print("Nous avons une erreur : $e");
    }
  }

  void locationToString() async{
    if(locationData != null){
      List<Placemark> placemarks = await placemarkFromCoordinates(locationData.latitude, locationData.longitude);
      print("Pays Actuellllllllll: ${placemarks.first.locality}");
      api();
    }
  }

  api() async{
    double lat, lon;
    if(locationData != null) {
      lat = locationData.latitude;
      lon = locationData.longitude;
    }
    if(lat != null && lon !=null){
      final key = "&APPID=969f06b6c0988a3f4c5aee2ab1977ce1";
      String lang = "&lang=${Localizations.localeOf(context).languageCode}";
      String baseAPI = "http://api.openweathermap.org/data/2.5/weather?";
      String coordString = "lat=$lat&lon=$lon";
      String units = "&units=metrics";
      String totalString = baseAPI + coordString + units + lang + key;
      final response = await http.get(Uri.parse(totalString));
      if(response.statusCode == 200){
        //print(response.body);
        Map map = json.decode(response.body);
        setState(() {
          temperature = Temperature(map);
          print(temperature.description);
        });
      }
      else{
        print("Mauvaise requette");
        print(response);
        print(totalString);
      }
    }



  }


}

