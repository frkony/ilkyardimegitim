import 'package:flutter/material.dart';

class AcilNumaraEkle extends StatefulWidget {
  const AcilNumaraEkle({super.key});

  @override
  State<AcilNumaraEkle> createState() => _AcilNumaraEkle();
}

class _AcilNumaraEkle extends State<AcilNumaraEkle> {
  String? isim;
  String? telefon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acil Kişi Ekle"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: "Örn: Annem",
                  labelText: "Acil kişi ismi"),
              onSaved: (newValue) {
                if (newValue != null) {
                  isim = newValue;
                } else {}
              },
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: "Örn: +905394698941",
                labelText: "Acil kişi numarası"),
            onSaved: (newValue) {
              if (newValue != null) {
                isim = newValue;
              } else {}
            },
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(onPressed: null, child: Text("Kaydet"))),
        ],
      ),
    );
  }
}
