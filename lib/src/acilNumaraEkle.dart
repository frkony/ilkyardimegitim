import 'package:flutter/material.dart';
import 'package:ilkyardimegitim/src/modal/acilKisi.dart';
import 'package:ilkyardimegitim/src/modal/acilKisiDatabaseProvider.dart';

class AcilNumaraEkle extends StatefulWidget {
  final AcilKisi kisi;
  const AcilNumaraEkle(this.kisi, {super.key});

  @override
  State<AcilNumaraEkle> createState() => _AcilNumaraEkle();
}

class _AcilNumaraEkle extends State<AcilNumaraEkle> {
  late AcilKisiDatabaseProvider acilKisiDatabaseProvider;
  String isim = "";
  String telefon = "";
  String yakinlikDerecesi = "";
  AcilKisi kisi = AcilKisi();
  final _textFormFieldcontrollerName = TextEditingController();
  final _textFormFieldcontrollerYakinlikDerecesi = TextEditingController();
  final _textFormFieldcontrollerPhone = TextEditingController();
  bool updateKisiFlag = false;

  @override
  void initState() {
    super.initState();
    acilKisiDatabaseProvider = AcilKisiDatabaseProvider();
    if (widget.kisi.id != null) {
      _textFormFieldcontrollerName.text = '${widget.kisi.isim}';
      _textFormFieldcontrollerYakinlikDerecesi.text =
          '${widget.kisi.yakinlikDerecesi}';
      _textFormFieldcontrollerPhone.text = '${widget.kisi.telefon}';
      updateKisiFlag = true;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _textFormFieldcontrollerName.dispose();
    _textFormFieldcontrollerYakinlikDerecesi.dispose();
    _textFormFieldcontrollerPhone.dispose();
  }

  void addAcilKisi(isim, telefon, yakinlikDerecesi) {
    AcilKisi kisi = AcilKisi();
    kisi.isim = isim;
    kisi.yakinlikDerecesi = yakinlikDerecesi;
    kisi.telefon = telefon;
    acilKisiDatabaseProvider.insertAcilKisi(kisi).then((value) => {
          if (value == true)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Kayıt Başarılı"))),
              _textFormFieldcontrollerName.text = "",
              _textFormFieldcontrollerYakinlikDerecesi.text = "",
              _textFormFieldcontrollerPhone.text = "",
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Beklenmedik Bir Hata Oluştu!"))),
            },
        });
  }

  void updateAcilKisi(isim, telefon, yakinlikDerecesi) {
    AcilKisi kisi = AcilKisi();
    kisi.id = widget.kisi.id;
    if (isim != "") {
      kisi.isim = isim;
    } else {
      kisi.isim = widget.kisi.isim;
    }
    if (telefon != "") {
      kisi.telefon = telefon;
    } else {
      kisi.telefon = widget.kisi.telefon;
    }
    if (yakinlikDerecesi != "") {
      kisi.yakinlikDerecesi = yakinlikDerecesi;
    } else {
      kisi.yakinlikDerecesi = widget.kisi.yakinlikDerecesi;
    }

    acilKisiDatabaseProvider.updateAcilKisi(widget.kisi.id!, kisi).then((res) {
      if (res == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Güncelleme Başarılı")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Beklenmedik Bir Hata Oluştu!")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acil Kişi Ekle"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: "Örn: Ambulans",
                  labelText: "Acil kişi ismi"),
              maxLength: 16,
              controller: _textFormFieldcontrollerName,
              onChanged: (newValue) {
                if (newValue.isNotEmpty) {
                  isim = newValue;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "Lütfen Acil Kişi İsmi Alanını Boş Bırakmayınız.")));
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: "Örn: Erkek Kardeş",
                  labelText: "Acil kişi Yakınlık Drecesi"),
              maxLength: 16,
              controller: _textFormFieldcontrollerYakinlikDerecesi,
              onChanged: (newValue) {
                if (newValue.isNotEmpty) {
                  yakinlikDerecesi = newValue;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "Lütfen Acil Kişi Yakınlık Derecesi Alanını Boş Bırakmayınız.")));
                }
              },
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: "Örn: 555 555 55 55",
                labelText: "Acil Kişi Telefon Numarası"),
            keyboardType: TextInputType.phone,
            controller: _textFormFieldcontrollerPhone,
            maxLength: 11,
            onChanged: (newValue) {
              if (newValue.isNotEmpty) {
                telefon = newValue;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Lütfen Acil Kişi Yakınlık Derecesi Alanını Boş Bırakmayınız.")));
              }
            },
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                  onPressed: () {
                    if (updateKisiFlag == true) {
                      updateAcilKisi(isim, telefon, yakinlikDerecesi);
                    } else {
                      if (isim.isNotEmpty && telefon.isNotEmpty) {
                        addAcilKisi(isim, telefon, yakinlikDerecesi);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "İsim Veya Telefon Alanı Boş Bırakılamaz!")));
                      }
                    }
                  },
                  child: updateKisiFlag
                      ? const Text("Güncelle")
                      : const Text("Kaydet"))),
        ],
      ),
    );
  }
}
