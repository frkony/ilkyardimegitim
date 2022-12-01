import 'package:ilkyardimegitim/src/core/init/database/databaseModel.dart';

class AcilKisi extends DatabaseModel<AcilKisi> {
  int? id;
  String? isim;
  String? yakinlikDerecesi;
  String? telefon;

  AcilKisi({this.id, this.isim, this.yakinlikDerecesi, this.telefon});

  AcilKisi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isim = json['isim'];
    yakinlikDerecesi = json['yakinlikDerecesi'];
    telefon = json['telefon'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // ignore: todo
    data['id'] = id; // TODO this. çevirlebilir
    data['isim'] = isim;
    data['yakinlikDerecesi'] = yakinlikDerecesi;
    data['telefon'] = telefon;
    return data;
  }

  @override
  AcilKisi fromJson(Map<String, dynamic> json) {
    return AcilKisi.fromJson(json);
  }
}
