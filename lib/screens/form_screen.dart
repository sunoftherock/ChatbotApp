import 'package:flutter/material.dart';
import 'match_screen.dart';
import 'package:hackathon_project/datafiles/colors.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormPageState();
}

class LoginData {
  String location = '';
  String firstName = '';
  String lastName = '';
  String gender = '';
  String sexuality = '';
  List<String> backgrounds = new List<String>();
}

var genders = ["Male", "Female", "Non-binary", "Other", "Don't wish to say"];
var sexualities = [
  "Straight",
  "Gay",
  "Bisexual",
  "Pansexual",
  "2 Spirit",
  "Asexual",
  "Aromantic",
  "Other",
  "Don't wish to say"
];

// var currentItemSelected = "Male";
class FormPageState extends State<FormPage> {
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

  List<String> options = [
    'Caucasian',
    'African',
    'Asian',
    'Latinx',
    'Christian',
    'Jewish',
    'Catholic',
    'Muslim',
    'Sikh',
    'Hindu'
  ];
  List<bool> selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  Widget buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < options.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: selected[i],
        label: Text(options[i], style: TextStyle(color: Colors.white)),
        avatar: FlutterLogo(),
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.black54,
        selectedColor: Colors.blue,
        onSelected: (bool selected2) {
          setState(() {
            selected[i] = selected2;
          });
        },
      );

      chips.add(filterChip);
    }

    return Wrap(
      // This next line does the trick.
      children: chips,
    );
  }

  chips() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: buildChips(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Personal Information'),
        backgroundColor: AppColors.lightBrown,
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
                      this.userData.firstName = value;
                    }),
                new TextFormField(
                    obscureText: false, // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Last Name', labelText: 'Last Name'),
                    onSaved: (String value) {
                      this.userData.lastName = value;
                    }),
                new TextFormField(
                    obscureText: false, // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Location', labelText: 'Location'),
                    onSaved: (String value) {
                      this.userData.location = value;
                    }),
                DropdownButton<String>(
                  items: genders.map((String dropDownStringItem) {
                    return new DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem));
                  }).toList(),
                  onChanged: ((String value) {
                    userData.gender = value;
                    setState(() {});
                  }),
                  value: userData.gender != '' ? userData.gender : null,
                  hint: Text("Please choose you gender"),
                ),
                DropdownButton<String>(
                  items: sexualities.map((String dropDownStringItem) {
                    return new DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem));
                  }).toList(),
                  onChanged: ((String value) {
                    userData.sexuality = value;
                    setState(() {});
                  }),
                  value: userData.sexuality != '' ? userData.sexuality : null,
                  hint: Text("Please choose you sexuality"),
                ),
                chips(),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Sign Up',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MatchPage()),
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
