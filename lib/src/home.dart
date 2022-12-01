import 'package:flutter/material.dart';
import 'package:ilkyardimegitim/src/acilNumaraEkle.dart';
import 'package:ilkyardimegitim/src/content.dart';
import 'package:ilkyardimegitim/src/modal/acilKisi.dart';
import 'package:ilkyardimegitim/src/modal/acilKisiDatabaseProvider.dart';
import 'package:ilkyardimegitim/src/jsonData/staticdata.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'mapsContent.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

const menu = ["Acil Numarası Ekle"];

class _Home extends State<Home> {
  late AcilKisiDatabaseProvider acilKisiDatabaseProvider;
  List<String>? basliklar;
  List<String>? icerik;
  List<String>? resim;
  AcilKisi kisi = AcilKisi();
  List<AcilKisi> acilListesi = [];

  @override
  void initState() {
    super.initState();
    acilKisiDatabaseProvider = AcilKisiDatabaseProvider();
    getAcilKisiList();
    setState(() {});
    basliklar = anabasliklar();
    resim = resimler();
  }

  /*@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    changeListener();
  }*/
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    changeListener();
  }

  Future<void> changeListener() async {
    acilListesi = await acilKisiDatabaseProvider.getAcilKisiList();
    print("acil list : $acilListesi");
    setState(() {});
  }

  Future<void> getAcilKisiList() async {
    acilListesi = await acilKisiDatabaseProvider.getAcilKisiList();
    setState(() {});
  }

  Future<void> removeacilKisi(id) async {
    await acilKisiDatabaseProvider.removeAcilKisi(id).whenComplete(() {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Kayıt Silme Başarılı")));
    });
    setState(() {
      getAcilKisiList();
    });
  }

  Future<void> allRemoveacilKisi() async {
    AcilKisiDatabaseProvider dbProvider = AcilKisiDatabaseProvider();
    await dbProvider.allRemoveAcilKisi().whenComplete(() => {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Toplu Kayıt Silme Başarılı")))
        });
    setState(() {
      getAcilKisiList();
    });
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
                      height: screenHeight / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Kişi : ${acilListesi.elementAt(index).isim}"),
                              Text(
                                  "Yakınlık : ${acilListesi.elementAt(index).yakinlikDerecesi}"),
                              Text(
                                  "Numara : ${acilListesi.elementAt(index).telefon}"),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              iconSize: 20,
                              constraints: const BoxConstraints(maxWidth: 30),
                              onPressed: () {
                                removeacilKisi(acilListesi.elementAt(index).id);
                              },
                              icon:
                                  const Icon(Icons.highlight_remove_outlined)),
                          IconButton(
                              iconSize: 20,
                              constraints: const BoxConstraints(maxWidth: 30),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AcilNumaraEkle(
                                          acilListesi.elementAt(index)),
                                    ));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              iconSize: 20,
                              constraints: const BoxConstraints(maxWidth: 30),
                              onPressed: () {
                                launchUrlString(
                                  "tel:${acilListesi.elementAt(index).telefon}",
                                );
                              },
                              icon: const Icon(Icons.call)),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: acilListesi.length)),
          actions: [
            TextButton(
              onPressed: () {
                allRemoveacilKisi();
              },
              child: const Text("Hepsini Sil"),
            ),
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AcilNumaraEkle(kisi)));
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
                child: const Text("Eğitim")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Maps()));
                },
                child: const Text("Yakındaki Hastaneler")),
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
