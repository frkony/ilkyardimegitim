import 'package:ilkyardimegitim/src/core/init/database/databaseProvider.dart';
import 'package:sqflite/sqflite.dart';
import 'acilKisi.dart';

class AcilKisiDatabaseProvider extends DatabaseProvider<AcilKisi> {
  final String _acilKisiDatabaseName = "ilkYardimDatabase";
  final String _acilKisiTableName = "acilKisi";
  final int _version = 1;
  late Database db;
  String columnId = "id";
  String columnIsim = "isim";
  String columnYakinlik = "yakinlikDerecesi";
  String columnTelefon = "telefon";

  @override
  Future<void> open() async {
    db = await openDatabase(
      _acilKisiDatabaseName,
      version: _version,
      onCreate: (db, version) {
        createTable(db);
      },
    );
  }

  Future<void> createTable(Database dbe) async {
    await dbe.execute(
        "CREATE TABLE $_acilKisiTableName (id INTEGER PRIMARY KEY AUTOINCREMENT, $columnIsim VARCHAR(40), $columnYakinlik NVARCHAR2(20), $columnTelefon VARCHAR(13))");
  }

  @override
  Future<List<AcilKisi>> getAcilKisiList() async {
    //if (!db.isOpen) open();
    await open();
    List<Map<String, dynamic>> acilKisiMap = await db.query(_acilKisiTableName);
    await close();
    return acilKisiMap.map((e) => AcilKisi.fromJson(e)).toList();
  }

  @override
  Future<AcilKisi> getAcilKisi(int id) async {
    //if (!db.isOpen) open();
    await open();
    AcilKisi kisi = AcilKisi();
    final acilKisiMap = await db.query(_acilKisiTableName,
        where: '$columnId = ?', columns: [columnId], whereArgs: [id]);
    if (acilKisiMap.isNotEmpty) {
      await close();
      return AcilKisi.fromJson(acilKisiMap.first);
    } else {
      await close();
      return kisi;
    }
  }

  @override
  Future<bool> removeAcilKisi(int id) async {
    //if (!db.isOpen) open();
    await open();
    final acilKisiMap = await db
        .delete(_acilKisiTableName, where: '$columnId = ?', whereArgs: [id]);
    await close();
    return !acilKisiMap.isNaN;
  }

  @override
  Future<bool> allRemoveAcilKisi() async {
    //if (!db.isOpen) open();
    await open();
    final acilKisiMap = await db.delete(_acilKisiTableName);
    await close();
    return !acilKisiMap.isNaN;
  }

  @override
  Future<bool> insertAcilKisi(AcilKisi model) async {
    //if (!db.isOpen) open();
    await open();
    final acilKisiMap = await db.insert(_acilKisiTableName, model.toJson());
    await close();
    return !acilKisiMap.isNaN;
  }

  @override
  Future<bool> updateAcilKisi(int id, AcilKisi model) async {
    //if (!db.isOpen) open();
    await open();
    final acilKisiMap = await db.update(_acilKisiTableName, model.toJson(),
        where: '$columnId = ?', whereArgs: [id]);
    await close();
    return !acilKisiMap.isNaN;
  }

  Future<void> close() async {
    await db.close();
  }
}
