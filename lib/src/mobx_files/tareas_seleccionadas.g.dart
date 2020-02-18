// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tareas_seleccionadas.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobxHomeTareas on _MobxHomeTareasBase, Store {
  final _$tareas_selccionadasAtom =
      Atom(name: '_MobxHomeTareasBase.tareas_selccionadas');

  @override
  int get tareas_selccionadas {
    _$tareas_selccionadasAtom.context
        .enforceReadPolicy(_$tareas_selccionadasAtom);
    _$tareas_selccionadasAtom.reportObserved();
    return super.tareas_selccionadas;
  }

  @override
  set tareas_selccionadas(int value) {
    _$tareas_selccionadasAtom.context.conditionallyRunInAction(() {
      super.tareas_selccionadas = value;
      _$tareas_selccionadasAtom.reportChanged();
    }, _$tareas_selccionadasAtom,
        name: '${_$tareas_selccionadasAtom.name}_set');
  }

  final _$buscarTareasAtom = Atom(name: '_MobxHomeTareasBase.buscarTareas');

  @override
  bool get buscarTareas {
    _$buscarTareasAtom.context.enforceReadPolicy(_$buscarTareasAtom);
    _$buscarTareasAtom.reportObserved();
    return super.buscarTareas;
  }

  @override
  set buscarTareas(bool value) {
    _$buscarTareasAtom.context.conditionallyRunInAction(() {
      super.buscarTareas = value;
      _$buscarTareasAtom.reportChanged();
    }, _$buscarTareasAtom, name: '${_$buscarTareasAtom.name}_set');
  }

  final _$_MobxHomeTareasBaseActionController =
      ActionController(name: '_MobxHomeTareasBase');

  @override
  void actionTareaSeleccionada(int entero) {
    final _$actionInfo = _$_MobxHomeTareasBaseActionController.startAction();
    try {
      return super.actionTareaSeleccionada(entero);
    } finally {
      _$_MobxHomeTareasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changebuscarTareas() {
    final _$actionInfo = _$_MobxHomeTareasBaseActionController.startAction();
    try {
      return super.changebuscarTareas();
    } finally {
      _$_MobxHomeTareasBaseActionController.endAction(_$actionInfo);
    }
  }
}
