import 'package:mobx_prueba/services/class.dart';
import 'package:postgres/postgres.dart';
export 'services.dart';

String host = '192.168.0.50'; int puerto = 5432; String user = 'postgres'; String passw = "123456"; String db = 'tareas';

Future<List<Tareas>> consultaTareas() async {
  var connection = PostgreSQLConnection(host, puerto, db, username: user, password: passw);
  List<Tareas> listR = [];
  await connection.open();
  List<List<dynamic>> results = await connection.query("SELECT * FROM dbo.tarea");
  //print(results);
  for (final row in results) {
    listR.add(Tareas.fromUsuarios(row));
  }
  return listR;
}

void guardarTareas(String valor) async {
  var connection = PostgreSQLConnection(host, puerto, db, username: user, password: passw);
  await connection.open();
  await connection.query("INSERT INTO dbo.tarea(descripcion, fecha_asig, periodo, fecha_ent, status) VALUES ($valor);");
}

Future<List<Usuarios>> consultaUsuarios(String pass) async {
  var connection = PostgreSQLConnection(host, puerto, db, username: user, password: passw);
  List<Usuarios> listR = [];
  await connection.open();
  List<List<dynamic>> results = await connection.query("SELECT * FROM dbo.usuario WHERE contrasena = '$pass'");
  for (final row in results) {
    listR.add(Usuarios.fromUsuarios(row));
  }
  return listR;
}