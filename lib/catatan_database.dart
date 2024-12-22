import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabaseeuy/catatan.dart';

class CatatanDatabase {
  final database = Supabase.instance.client.from('catatan');

  Future createCatatan(Catatan newCatatan) async{
    await database.insert(newCatatan.toMap());
  }

  final stream = Supabase.instance.client.from('catatan').stream(
    primaryKey: ['id'],
  ).map((data) => data.map((catatanMap) => Catatan.fromMap(catatanMap)).toList());

  Future updateCatatan(Catatan oldCatatan, String newContent) async {
    await database.update({'content': newContent}).eq('id', oldCatatan.id!);
  }

  Future deleteCatatan(Catatan catatan) async {
    await database.delete().eq('id', catatan.id!);
  }
}