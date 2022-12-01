import 'package:flutter/material.dart';

class TemelIlkYardim extends StatefulWidget {
  const TemelIlkYardim({super.key});

  @override
  State<TemelIlkYardim> createState() => _TemelIlkYardim();
}

class _TemelIlkYardim extends State<TemelIlkYardim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.baslik"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "lib/src/Picture/ilkyardim.png",
              width: 100,
            ),
            const Text(""),
            const Text(""),
          ],
        ),
      ),
    );
  }
}
