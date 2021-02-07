import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:location/location.dart';

void main() => runApp(new MaterialApp(
  title: 'Forms in Flutter',
  home: new LoginPage(),
));

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginData {
  String school = '';
  String first_name = '';
  String last_name = '';
  var _gender = ["Male", "Female", "Other", "Do not Self-Identify"];
  var _currentItemSelected = _gender[0];
}

class _PageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();


  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('First Name: ${_data.first_name}');
      print('Last Name: ${_data.last_name}');

    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Personal Information'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                keyboardType: TextInputType.text, // Use email input type for emails.
                decoration: new InputDecoration(
                  hintText: 'First Name',
                  labelText: 'First Name'
                ),
                onSaved: (String value) {
                  this._data.first_name = value;
                }
              ),
              new TextFormField(
                obscureText: false, // Use secure text for passwords.
                decoration: new InputDecoration(
                  hintText: 'Last Name',
                  labelText: 'Last Name'
                ),
                onSaved: (String value) {
                  this._data.last_name = value;
                }
              ),
              DropdownButton<String>(
                items: _gender.map((String dropDownStringItem){
                  return dropDownStringItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem)
                  );
                }).toList(),
                onChanged:(value){
                  setState({
                    this._currentItemSelected = value;
                  });
                }
                value: _currentItemSelected;
              ),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Information',
                    style: new TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: this.submit,
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(
                  top: 20.0
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}