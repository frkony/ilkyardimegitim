import 'package:flutter/material.dart';
import 'package:ilkyardimegitim/src/content.dart';
import 'package:ilkyardimegitim/src/staticdata.dart/staticdata.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<String>? basliklar;
  List<String>? icerik;
  List<String>? resim;

  @override
  void initState() {
    super.initState();
    basliklar = anabasliklar();
    resim = resimler();
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final screenWidth = screenInfo.size.width;
    final screenHeight = screenInfo.size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Content(),
                      ));
                },
                child: Text("Eğitim")),
            ElevatedButton(
                onPressed: () {
                  launchUrlString("tel:+905379980698");
                },
                child: Text("S.O.S")),
          ],
        ),
      ),
    );
  }
}
