import 'package:flutter/material.dart';
import 'package:ilkyardimegitim/src/staticdata.dart/staticdata.dart';
import 'package:ilkyardimegitim/src/temelilkyard%C4%B1m.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _Content();
}

class _Content extends State<Content> {
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
      appBar: AppBar(
        title: const Text("İlk Yardım Programı"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TemelIlkYardim(),
                                  ));
                            },
                            child: Card(
                              margin: const EdgeInsets.all(5),
                              elevation: 8,
                              shape: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      child: Image.asset(
                                        "lib/src/Picture/ilkyardim.png",
                                        width: screenWidth / 3,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(basliklar!.elementAt(index))),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: basliklar!.length),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
