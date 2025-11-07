import 'package:flutter/material.dart';
import 'package:weathery/model/user.dart';
import 'package:weathery/service/file_manager.dart';

class Filecontroller extends ChangeNotifier {
  String? _text = '';
  User? _user;

  String get text => _text!;
  User get user => _user!;

  readText() async {
    _text = await FileManager().readTextFile('myfile.txt');
    notifyListeners();
  }

  writeText() async {
    _text = await FileManager().writeTextFile('myfile.txt');
    notifyListeners();
  }

  readJson() async {
    _user = User.fromJson(await FileManager().readJsonFile());
    notifyListeners();
  }

  writejson() async {
    _user = await FileManager().writeJsonFile();
    notifyListeners();
  }
}
