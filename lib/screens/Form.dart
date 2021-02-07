import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginData {
  String school = '';
  String firstName = '';
  String lastName = '';
  String gender = '';
  List<String> backgrounds = new List<String>();
}

  var genders = ["Male", "Female", "Other", "Do not Self-Identify"];
  // var currentItemSelected = "Male";
class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LoginData userData = new LoginData();


  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('First Name: ${userData.firstName}');
      print('Last Name: ${userData.lastName}');

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
                  this.userData.firstName = value;
                }
              ),
              new TextFormField(
                obscureText: false, // Use secure text for passwords.
                decoration: new InputDecoration(
                  hintText: 'Last Name',
                  labelText: 'Last Name'
                ),
                onSaved: (String value) {
                  this.userData.lastName = value;
                }
              ),
              DropdownButton<String>(
                items: genders.map((String dropDownStringItem){
                  return DropDownStringItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem)
                  );
                }).toList(),
                onChanged:((value) =>
                    userData.gender = value);
                  );
                }
                value: currentItemSelected;
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