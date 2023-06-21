import 'dart:async';
import 'package:flutter/material.dart';

class ThemeBloc {
  //creando un sctream controller que emitira eventos de tipo ThemeMode
  final _themeController = StreamController<ThemeMode>.broadcast();
  //Definiendo un getter llamado themeStream que devuelve un stream del tipo ThemeMode
  Stream<ThemeMode> get themeStream => _themeController.stream;

  //declaracion de la variable currentTheme privada
  ThemeMode _currentTheme = ThemeMode.light;
  //Definiendo un getter currentTheme de tipo ThemeMode para acceder a _currentTheme
  ThemeMode get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _themeController.sink.add(_currentTheme);
  }

  void dispose() {
    _themeController.close();
  }
}
