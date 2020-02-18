import 'package:mobx/mobx.dart';
part 'tareas_seleccionadas.g.dart'; // Include generated file

// This is the class used by rest of your codebase
class MobxHomeTareas = _MobxHomeTareasBase with _$MobxHomeTareas;

// The store-class
abstract class _MobxHomeTareasBase with Store {
  @observable
  int tareas_selccionadas;

  @action
  void actionTareaSeleccionada(int entero) {
    tareas_selccionadas = entero;
  }

  
  @observable
  bool buscarTareas = false;

  @action
  void changebuscarTareas() {
    buscarTareas = !buscarTareas;
  }

}