import 'package:mobx_prueba/services/class.dart';
import 'package:postgres/postgres.dart';
export 'services.dart';

var host = '192.168.0.50';
var puerto = 5432;
var user = 'postgres';
var pass = '123456';
var db = 'tareas';

Future<List<Tareas>> consultaTareas() async {
  var connection = PostgreSQLConnection(host, puerto, db, username: user, password: pass);
  List<Tareas> listR = [];
  await connection.open();
  List<List<dynamic>> results = await connection.query("SELECT * FROM dbo.tarea");
  print(results);
  for (final row in results) {
    Tareas t = Tareas(row[0],row[1],row[2],row[3],row[4],row[5]);
    print(t.descripcion);
    listR.add(t);
  }
  return listR;
}

Future<List<Usuarios>> consultaUsuarios(String pass) async {
  var connection = PostgreSQLConnection('192.168.0.50', 5432, "tareas", username: 'postgres', password: '123456');
  List<Usuarios> listR = [];
  await connection.open();
  List<List<dynamic>> results = await connection.query("SELECT * FROM dbo.usuario WHERE contrasena = '$pass'");
  for (final row in results) {
    Usuarios t = Usuarios(row[0],row[1],row[2],row[3],row[4],row[5]);
    listR.add(t);
  }
  return listR;
}