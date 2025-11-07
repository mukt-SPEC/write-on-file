import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathery/controller/controller.dart';
import 'package:weathery/widget/button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('json to model'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Color(0xff313131),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Manipulating JSON in Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                context.select((Filecontroller controller) => controller.text),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),

              AppButton(
                text: 'save as txt',
                onTap: () => context.read<Filecontroller>().writeText(),
                color: Colors.white10,
                textColor: Colors.grey[700]!,
              ),
              SizedBox(height: 20),
              AppButton(
                text: 'save as json',
                onTap: () {
                  context.read<Filecontroller>().writejson();
                },
                color: Colors.white10,
                textColor: Colors.grey[700]!,
              ),
              SizedBox(height: 20),
              AppButton(
                text: 'save image file',
                onTap: () {},
                color: Colors.white10,
                textColor: Colors.grey[700]!,
              ),
              SizedBox(height: 20),
              AppButton(
                text: 'delete file',
                onTap: () {},
                color: Colors.white10,
                textColor: Colors.grey[700]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
