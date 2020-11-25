import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // Singleton
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();
  // Fin Singleton

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // bool _colorSecuandrio
  // int _genero
  // String nombre

  get name {
    return _prefs.getString('name') ?? 'Pedruchis';
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  get color {
    return _prefs.getBool('color') ?? false;
  }

  set color(bool value) {
    _prefs.setBool('color', value);
  }
}
