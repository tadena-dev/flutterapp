import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

//Create a class Info
class Info {
  final String id;
  final String firstname;
  final String lastname;
  final String address;

  //Constructor
  Info({
    required this.firstname,
    required this.lastname,
    required this.address,
  }) : id = const Uuid().v4();
}

//Create a Singleton class that extends a ValueNotifier
//with InfoList
class InfoList extends ValueNotifier<List<Info>> {
  InfoList._sharedInstance() : super([]);
  static final InfoList _shared = InfoList._sharedInstance();
  factory InfoList() => _shared;

  //Length of InfoList
  int get length => value.length;

  //add function -- adding info
  void add({required Info info}) {
    final infos = value;
    infos.add(info);
    notifyListeners();
  }

  //remove function -- removing info
  void remove({required Info info}) {
    final infos = value;
    if (infos.contains(info)) {
      infos.remove(info);
      notifyListeners();
    }
  }

  //info function -- returns a info with index
  Info? info({required int atIndex}) {
    return value.length > atIndex ? value[atIndex] : null;
  }
}
