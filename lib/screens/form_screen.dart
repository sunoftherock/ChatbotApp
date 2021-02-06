import 'package:flutter/material.dart';
import '../Depreciated/matches_screen.dart';

void main() => runApp(new MaterialApp(
      title: 'Forms in Flutter',
      home: new FormPage(),
    ));

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FormPageState();
}

class _FormData {
  String location = '';
  String firstName = '';
  String lastName = '';
  String gender = '';
  String sexualOrientation = '';
  List<String> background = new List<String>();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _FormData _data = new _FormData();

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('First Name: ${_data.firstName}');
      print('Last Name: ${_data.lastName}');
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
                    keyboardType:
                        TextInputType.text, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'First Name', labelText: 'First Name'),
                    onSaved: (String value) {
                      this._data.firstName = value;
                    }),
                new TextFormField(
                    obscureText: false, // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Last Name', labelText: 'Last Name'),
                    onSaved: (String value) {
                      this._data.lastName = value;
                    }),
                new TextFormField(
                    obscureText: false, // Use secure text for passwords.
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: 'Gender', labelText: 'Gender'),
                    onSaved: (String value) {
                      this._data.gender = value;
                    }),
                new TextFormField(
                    obscureText: false, // Use secure text for passwords.
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: 'location', labelText: 'location'),
                    onSaved: (String value) {
                      this._data.location = value;
                    }),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Information',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}
