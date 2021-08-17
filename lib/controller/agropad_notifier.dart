import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mon_agro/Agropad.dart';

class AgroPadNotifier extends ChangeNotifier{
  List<Agropad> _agroPadList = [];

  UnmodifiableListView<Agropad> get agroPadList => UnmodifiableListView(_agroPadList);


  showAgropad(index){
    _agroPadList.first.Nom;
    notifyListeners();
  }
}