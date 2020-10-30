import 'package:EventApp/services/auth.dart';
import 'package:EventApp/shared/const.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthSerivce _auth = AuthSerivce();
  final _formKey = GlobalKey<FormState>();

  //
  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        elevation: 0.0,
        title: Text('Sign up to MeetApp'),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Sign In"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: inputFieldDec().copyWith(hintText: "Email"),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: inputFieldDec().copyWith(hintText: "Password"),
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => pass = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.registerWithEmailAndPassword(email, pass);
                    if (result == null) {
                      setState(() => error = "Supply valid info");
                    }
                  }
                },
                color: Colors.grey,
                child: Text("Sign up", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
