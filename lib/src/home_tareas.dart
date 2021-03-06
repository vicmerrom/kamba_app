import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_prueba/services/class.dart';
import 'package:mobx_prueba/services/services.dart';
import 'package:mobx_prueba/src/registro_tareas.dart';
import 'mobx_files/tareas_seleccionadas.dart';

class HomeTareasPage extends StatefulWidget {
  final List<Usuarios> usuariosLogeados;
  HomeTareasPage(this.usuariosLogeados);

  
  @override
  _HomeTareasPageState createState() => _HomeTareasPageState();
}

class _HomeTareasPageState extends State<HomeTareasPage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  List<Tareas> listaTareas = [];
  final _counterHomeTareas= MobxHomeTareas();
  bool buscarTareas = false;
  final widgetNone = Padding(padding: EdgeInsets.all(0.00));

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    consultaTareas().then((res) => setState(() => listaTareas = res));
    super.initState();
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
            builder: (_) =>_counterHomeTareas.buscarTareas == false 
          ? Text(widget.usuariosLogeados[0].nombre +' '+ widget.usuariosLogeados[0].apellido, style: TextStyle( fontSize: 16.00),) 
          : TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Búsqueda',
              focusColor: Colors.white,
              icon: Icon(Icons.search, color: Colors.white,),
            ),
          ),
        ),
        leading: Observer( builder: (_) =>
          _counterHomeTareas.buscarTareas == false 
          ? Icon(Icons.check_box, size: 40.00,) 
          : IconButton(icon: Icon(Icons.keyboard_backspace, size: 35.00,), onPressed: () => _counterHomeTareas.changebuscarTareas()),
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
          Tab(icon: Icon(Icons.watch_later), 
            text: 'Por Hacer',
          ),
          Tab(
            icon: Icon(Icons.access_time),
             text: 'En Curso',
          ),
          Tab(
            icon: Icon(Icons.check),
             text: 'Terminado',
          )
        ],
        controller: _tabController,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,),
        bottomOpacity: 1,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.insert_chart), 
            tooltip: 'Chart', 
            onPressed: () => print(''),
          ),
          Observer( builder: (_) =>
            _counterHomeTareas.buscarTareas == false ? 
              IconButton(
                icon: Icon(Icons.search), 
                tooltip: 'Busqueda',
                onPressed: () => _counterHomeTareas.changebuscarTareas()
              ) : widgetNone,
          ),
        ],
      ),        
      backgroundColor: Colors.grey[300],
      body: TabBarView(
        children: [
          containerListaTareas('EN PROCESO'),
          containerListaTareas('EN CURSO'),
          containerListaTareas('TERMINADO'),
        ],
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroTareasPage(widget.usuariosLogeados))),
        child: Icon(Icons.add),
        tooltip: 'Crear nueva tarea',
      ),
    );
  }

  void _confirmacionTerminarTarea() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¿Está seguro que desea finalizar esta tarea?"),
          //content: Text("Alert Dialog body"),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCELAR"),
              onPressed: () {
                _counterHomeTareas.actionTareaSeleccionada(null);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("FINALIZAR"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _dialogInfoTareas(context, Tareas dt) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text("¿Está seguro que desea finalizar esta tarea?"),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('Descripción'),
                  subtitle: Text(dt.descripcion),
                ),
                ListTile(
                  title: Text('Fecha de creación'),
                  subtitle: Text(fechaFiltrada(dt.fecha_asig.toString(), '.')),
                ),
                ListTile(
                  title: Text('Fecha limite'),
                  subtitle: Text(fechaFiltrada(dt.fecha_asig.toString(), '.')),
                ),
                ListTile(
                  title: Text('Usuario asignado'),
                  subtitle: Text('PEDRO PEREZ'),
                ),
                ListTile(
                  title: Text('Estado de la tarea'),
                  subtitle: Text(dt.status),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("CERRAR"),
              onPressed: ()  => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Widget containerListaTareas(status){
    List<Widget> listR = [];
    for (var i = 0; i < listaTareas.length; i++) {
      if (listaTareas[i].status == status) {
        listR.add(Container(
          margin: EdgeInsets.all(10.00),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.00)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],
          ),
          child: ListTile(
            leading: Observer(builder: (_) => 
            status != 'TERMINADO' 
            ? Checkbox(
              value: _counterHomeTareas.tareas_selccionadas == i ? true : false,
              onChanged: (b) {
                _counterHomeTareas.actionTareaSeleccionada(i);
                if (_counterHomeTareas.tareas_selccionadas == i) {
                  _confirmacionTerminarTarea();
                }  
              }
            )
            : Icon(Icons.check_circle, color: Colors.green, size: 35.00,)
            ),
            title: Text(listaTareas[i].descripcion),
            subtitle: Text(fechaFiltrada(listaTareas[i].fecha_asig.toString(), '.')),
            onLongPress: () => _dialogInfoTareas(context, listaTareas[i]),
          ),
        ));         
      }
     
    }
    return listR.length > 0 ? Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: listR,
      ),
    ) : Center( child: Text('NO SE HAN ENCONTRADO TAREAS $status'),);
    }
    
  }//

  String fechaFiltrada(String fecha, String splid){
    var d = (fecha == null ? (DateTime.now().toString()) : fecha).split(splid);
    return d[0];
  }


  class Item {
    const Item(this.name,this.icon);
    final String name;
    final Icon icon;
  }
  Item selectedUser;
  List<Item> users = <Item>[
    const Item('Mantenimiento',Icon(Icons.android,color:  const Color(0xFF167F67),)),
    const Item('Reparacion',Icon(Icons.flag,color:  const Color(0xFF167F67),)),
    const Item('Entrenamiento',Icon(Icons.format_indent_decrease,color:  const Color(0xFF167F67),)),
    const Item('Instalacion',Icon(Icons.mobile_screen_share,color:  const Color(0xFF167F67),)),
  ];