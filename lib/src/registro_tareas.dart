import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_prueba/services/class.dart';

class RegistroTareasPage extends StatefulWidget {
  final List<Usuarios> usuariosLogeado;
  RegistroTareasPage(this.usuariosLogeado);

  @override
  _RegistroTareasPageState createState() => _RegistroTareasPageState();
}

class _RegistroTareasPageState extends State<RegistroTareasPage> with SingleTickerProviderStateMixin{

  Usuarios selectedUsuario;

  @override
  void initState() {

    super.initState();
  }

DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(text: picked.toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nueva tarea"),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () => _confirmacionDescartar(),
          tooltip: 'Volver atras',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            tooltip: 'Guardar Tarea',
            onPressed: ()=> print(''),
          ),
        ],
      ),        
      backgroundColor: Colors.grey[300],
      body: Container(
        margin: EdgeInsets.all(20.00),
        width: MediaQuery.of(context).size.width - 40.00,
        child: ListView(
          children: <Widget>[
            _text('¿Qué hay que hacer?'),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.keyboard),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.00),),
            _text('Fecha límite'),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _date,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_today,
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.00),),
            _text('Añadir a la lista'),
            DropdownButton<Item>(
              icon: Icon(Icons.format_list_bulleted),
              isExpanded: true,
              hint:  Text("Por defecto"),
              value: selectedUser,
              onChanged: (Item Value) { },
              items: users.map((Item user) {
                return  DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      user.icon,
                      SizedBox(width: 10,),
                      Text(user.name, style:  TextStyle(color: Colors.black),),
                    ],
                  ),
                );
              }
              ).toList(),
            ),
            _text('Usuario'),
            DropdownButton<Usuarios>(
              icon: Icon(Icons.supervised_user_circle),
              isExpanded: true,
              hint:  Text("Por defecto"),
              value: selectedUsuario,
              onChanged: (Usuarios Value) { },
              items: widget.usuariosLogeado.map((Usuarios users) =>
                DropdownMenuItem<Usuarios>(
                  value: users,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(Icons.person),
                      SizedBox(width: 10,),
                      Text(users.nombre +' '+ users.apellido, style:  TextStyle(color: Colors.black),),
                    ],
                  ),
                ),
              ).toList(),
            ),
          ]
        ), 
      ),
    );
  }

  Widget _text(label){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text(label,
          textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  }

    void _confirmacionDescartar() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¿Está seguro de salir sin guardar esta tarea?"),
          //content: Text("Alert Dialog body"),
          actions: <Widget>[
            FlatButton(
              child: Text("NO"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("SI"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}//



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


