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
    factory Tareas.fromUsuarios(List l){
      return Tareas(l[0],l[1],l[2],l[3],l[4],l[5]);
    }
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
    factory Usuarios.fromUsuarios(List l){
      return Usuarios(l[0],l[1],l[2],l[3],l[4],l[5]);
    }
}