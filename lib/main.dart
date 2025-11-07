import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathery/controller/controller.dart';
import 'package:weathery/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Filecontroller())],
      child: const Readjson(),
    ),
  );
}

class Readjson extends StatelessWidget {
  const Readjson({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<Filecontroller>().readText();
    context.read<Filecontroller>().readJson();
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
