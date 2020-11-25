import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/shared_prefs/user_prefs.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  int _genero = 1;
  String _name = 'Pedro';
  TextEditingController _nameController;

  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  _loadPreferences() async {
    _genero = prefs.genero;
    _nameController = new TextEditingController(text: prefs.name);
    _colorSecundario = prefs.color;
    setState(() {});
  }

  _setSelectedRadio(int value) async {
    prefs.genero = value;
    _genero = value;
    setState(() {});
  }

  _setNameController(String value) async {
    prefs.name = value;
    _nameController = prefs.name;
    setState(() {});
  }

  _setColor(bool value) async {
    prefs.color = value;
    _colorSecundario = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0)),
          ),
          Divider(),
          SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: _setColor),
          RadioListTile(
              title: Text('Masculino'),
              value: 1,
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          RadioListTile(
            title: Text('Femenino'),
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el telefono'),
              onChanged: _setNameController,
            ),
          ),
        ],
      ),
    );
  }
}
