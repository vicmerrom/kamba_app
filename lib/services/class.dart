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
  String contrasena;
  String conf_contrasena;
  String email;
    Usuarios(
      this.id,
      this.nombre,
      this.apellido,
      this.contrasena,
      this.conf_contrasena,
      this.email,
    );
}