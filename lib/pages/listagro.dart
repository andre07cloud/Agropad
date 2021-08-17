import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mon_agro/controller/agropad_notifier.dart';
import 'package:mon_agro/pages/dashboard.dart';
import 'package:provider/provider.dart';
import '../Agropad.dart';
import '../Agro.dart';

class Listagro extends StatefulWidget{

  Listagro({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListagroState createState() => _ListagroState();

}

class _ListagroState extends State<Listagro> {
  Agropad agropad;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  goToDashboard(Agropad agropad) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Dashboard(agropad: agropad,))
    );
    
  }

  @override
  Widget build(BuildContext context) {
    AgroPadNotifier agroPadNotifier = Provider.of<AgroPadNotifier>(context);

    //listAgropad().then((value) => print(value.length));
    //List agropads = listAgropad() as List;


    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        title: Text('AGROPADS'),
    ),
    // body: ListView.builder(
    //       itemCount: agroPadData == null ? 0 : agroPadData.length,
    //       //itemBuilder: (BuildContext context, int index){
    //         //return Card(
    //          // child: Row(
    //            // children: <Widget>[
    //              // Text("${agroPadData.length}"),
    //               //Text("${agroPadData[index].Nom}"),
    //             //],
    //           ),
      body: Container(


        child: Card(
          color: Colors.green,
          child: FutureBuilder(
            future: listAgropad(),
            builder: (_, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Container(
                  height: MediaQuery.of(context).size.height* 0.9,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(70),
                      bottomRight: const Radius.circular(70),
                    ),
                  ),
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              }
              else
                return ListView.builder(


                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index){
                  return Card(
                    elevation: 15.0,

                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () => goToDashboard(snapshot.data[index]),
                          tileColor: Colors.black12,
                          leading: Image(
                            image: AssetImage('../../images/agropad.jpg'),
                          ),
                          title: Text(snapshot.data[index].Nom),
                          subtitle: Text(snapshot.data[index].Description),
                          trailing: Icon(Icons.wb_shade),
                        ),
                        // Row(
                        //
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        //     Container(
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(left: 16.0),
                        //         child: Text("${snapshot.data[index].Nom}"),
                        //       ),
                        //     ),
                        //
                        //     Container(
                        //       width: 250,
                        //       height: 200,
                        //       child: ClipRRect(
                        //         borderRadius: BorderRadius.circular(24.0),
                        //         child: Image(
                        //           fit: BoxFit.contain,
                        //           alignment: Alignment.topRight,
                        //           image: NetworkImage("https://www.led-horticoles.eu/wp-content/uploads/2015/01/agropad-led-horticole-660w-2017-croissance-floraison.jpg"),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // )
                        // Image.asset('../../images/baro.jpg',
                        //     fit: BoxFit.scaleDown),
                        //Text(snapshot.data[index].createdBy),
                      ],
                    ),


                  );
                });
            },
          ),
        ),
      ),
            );
          }
  @override
  void initState() {
    super.initState();


    print("Bonnnnnnnnnnnnnnnnnnnnnnjouuuuuuuuuuuuuurrrrrrr");
    listAgropad();
    print("Bonnnnnnnnnnnnnnnnnnnnnnjouuuuuuuuuuuuuurrrrrrrooooooooooooooooooohhhhhhhhh");
  }


// ),
   // );
  }


  //List<Map> data;
  //List<Agropad> agroPadData;
  Future<List<Agropad>> listAgropad() async{

    final url ='http://161.35.228.42:3000/AllAgroPads';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print(response.body);
      //var data = response.body;
      var agroPadData = json.decode(response.body);
      List<Agropad> agropads = [];

     // print("MAAAAAAAAA LISTTTTTTTTTEE${data}");
     // print("MAAAAAAAAA LISTTTTTTTTTEE");
      //agroPadData = agroFromJson(data);
     // print("MON TESTTTT ${agroPadData.first.Nom}");
     // return agroPadData;
     //  setState(() {
        //agropad = Agropad(data);
        //agroPadData = data as List;
        for(var a in agroPadData){
            Agropad agropad = Agropad(a);
            agropads.add(agropad);
        }
        print("LA TAILLE: ${agropads.length}");
        return agropads;

      // });
    }
    else{
      print("Mauvaise requette");
      print(response);
      return [];
    }
  }

  // class DetailAgroPad extends StatefulWidget{
  //
  //   final S
  //
  // }



