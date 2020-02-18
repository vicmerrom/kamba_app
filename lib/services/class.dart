class Tareas{
  dynamic cod_tarea;
  String descripcion;
  DateTime fecha_asig;
  dynamic periodo;
  DateTime fecha_ent;
  String status;
    Tareas(
      this.cod_tarea,
      this.descripcion,
      this.fecha_asig,
      this.periodo,
      this.fecha_ent,
      this.status,
    );
}

class Usuarios{
  int id;
  String nombre;
  String apellido;
  String email;
  String contrasena;
  String conf_contrasena;
    Usuarios(
      this.id,
      this.nombre,
      this.apellido,
      this.email,
      this.contrasena,
      this.conf_contrasena,
    );
}