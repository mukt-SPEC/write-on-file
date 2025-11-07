import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:weathery/model/user.dart';
import 'package:weathery/service/file_manager.dart';

class Filecontroller extends ChangeNotifier {
  String? _text = '';
  User? _user;
  Uint8List? _image;

  String get text => _text!;
  User get user => _user!;
  Uint8List get image => _image!;

  readText() async {
    _text = await FileManager().readTextFile('myfile.txt');
    notifyListeners();
  }

  writeText() async {
    _text = await FileManager().writeTextFile('myfile.txt');
    notifyListeners();
  }

  readJson() async {
    final result = await FileManager().readJsonFile();
    if (result != null) {
      _user = User.fromJson(result);
    }
    notifyListeners();
  }

  writejson() async {
    _user = await FileManager().writeJsonFile();
    notifyListeners();
  }

  readimage() async {
    _image = await FileManager().readImagefile();
    notifyListeners();
  }

  writeimage() async {
    _image = await FileManager().writeImagefile();
    notifyListeners();
  }

  deleteimage() async {
    await FileManager().deleteImageFile();
    _image = null;
    notifyListeners();
  }
}
