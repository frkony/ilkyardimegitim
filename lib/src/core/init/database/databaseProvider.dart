import 'package:ilkyardimegitim/src/core/init/database/databaseModel.dart';

abstract class DatabaseProvider<T extends DatabaseModel> {
  Future open();
  Future<List<T>> getAcilKisiList();
  Future<T> getAcilKisi(int id);
  Future<bool> removeAcilKisi(int id);
  Future<bool> allRemoveAcilKisi();
  Future<bool> insertAcilKisi(T model);
  Future<bool> updateAcilKisi(int id, T model);
}
