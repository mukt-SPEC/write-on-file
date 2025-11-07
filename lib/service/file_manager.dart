import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weathery/model/user.dart';

class FileManager {
  static FileManager? _instance;

  FileManager._internal() {
    _instance = this;
  }

  factory FileManager() => _instance ?? FileManager._internal();

  Future<String> get _directoryPath async {
    if (Platform.isAndroid) {
      Directory? directory = await getExternalStorageDirectory();
      return directory!.path;
    }
    return '';
  }

  Future<File> getFile(String filename) async {
    final path = await _directoryPath;
    return File('$path/$filename');
  }

  Future<File> get _JsonFile async {
    final path = await _directoryPath;
    String filename = 'test.json';
    return File('$path/$filename');
  }

  Future<String> readTextFile(String filename) async {
    String contents = 'random things';

    try {
      final file = await getFile(filename);
      contents = await file.readAsString();
      return contents;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> writeTextFile(String filename) async {
    String text = DateFormat('yyyy-MM-dd – kk:mm:ss').format(DateTime.now());
    final file = await getFile(filename);
    await file.writeAsString(text);
    return text;
  }

  Future<Map<String, dynamic>?> readJsonFile() async {
    String content = 'file in json';

    File file = await _JsonFile;

    if (await file.exists()) {
      try {
        content = await file.readAsString();
        final Map<String, dynamic> userFormat = json.decode(content);
        //final user = User.fromJson(userFormat);
        return userFormat;
      } catch (e) {
        return null;
        print(e);
      }
    }
  }

  Future<User> writeJsonFile() async {
    final User user = User(name: 'mustyy', age: 12, nicknames: ['mus', 'lm']);
    Map<String, dynamic> userEncode = user.toJson();

    File file = await _JsonFile;
    await file.writeAsString(json.encode(userEncode));
    return user;
  }
}
