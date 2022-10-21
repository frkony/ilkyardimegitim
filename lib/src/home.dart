import 'package:flutter/material.dart';
import 'package:ilkyardimegitim/modal/acilKisi.dart';
import 'package:ilkyardimegitim/src/acilNumaraEkle.dart';
import 'package:ilkyardimegitim/src/content.dart';
import 'package:ilkyardimegitim/src/staticdata.dart/staticdata.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

const Menu = ["Acil Numarası Ekle"];
const Menu2 = {"2"};

class _Home extends State<Home> {
  List<String>? basliklar;
  List<String>? icerik;
  List<String>? resim;
  acilKisi kisi = acilKisi();
  List<acilKisi>? listKisi = [];
  String? numara;

  @override
  void initState() {
    basliklar = anabasliklar();
    resim = resimler();
    kisi.isim = "Acil Ambulans";
    kisi.numara = "112";
    listKisi?.add(kisi);
    kisi = acilKisi();
    kisi.isim = "Splinter Usta";
    kisi.numara = "+905379980698";
    listKisi?.add(kisi);
    kisi = acilKisi();
    kisi.isim = "Canmânâ";
    kisi.numara = "+905415404310";
    listKisi?.add(kisi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final screenWidth = screenInfo.size.width;
    final screenHeight = screenInfo.size.height;

    Future openDialog() async {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Acil Numaralar"),
          content: Container(
              width: screenWidth,
              height: screenHeight / 2.5,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: screenHeight / 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kişi : ${listKisi?.elementAt(index).isim}"),
                              Text(
                                  "Numara : ${listKisi?.elementAt(index).numara}"),
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                launchUrlString(
                                  "tel:${listKisi!.elementAt(index).numara}",
                                );
                              },
                              child: Text("Ara"))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: listKisi!.length)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kapat"),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Temel İlk Yardım"),
        actions: [
          PopupMenuButton(onSelected: (value) {
            if (value == 0) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AcilNumaraEkle()));
            }
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                value: 0,
                child: Text("Acil Numarası Ekle"),
              )
            ];
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Content(),
                      ));
                },
                child: Text("Eğitim")),
            ElevatedButton(
                onPressed: () {
                  openDialog();
                },
                child: const Text("Acil Numaralar")),
          ],
        ),
      ),
    );
  }
}
