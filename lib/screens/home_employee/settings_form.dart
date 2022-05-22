import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domestic_pal/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();

  String _currentname;
  String _currentPhone;
  String _currentLocation;
  String _currentGender;
  String _currentaadhar;
  String _currentworkExperience;
  String _currentrating;
  String _currentjobProfile;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final user = Provider.of<User>(context);
    return StreamBuilder<EmployeeUserData>(
        stream: DatabaseEmployeeService(uid: user.uid).empDetails,
        builder: (context, snapshot) {
          //if (snapshot.hasData) {
          EmployeeUserData userData = snapshot.data;
          return SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Text('Update your Settings'),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: textInputDecorationEmp,
                      initialValue: userData.name,
                      validator: (value) =>
                          value.isEmpty ? 'Please enter a name' : null,
                      onChanged: (value) =>
                          setState(() => _currentname = value),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: textInputDecorationEmp,
                      initialValue: userData.phoneNo,
                      validator: (value) =>
                          value.isEmpty ? 'Please enter a Phone Number' : null,
                      onChanged: (value) =>
                          setState(() => _currentPhone = value),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: textInputDecorationEmp,
                      initialValue: userData.location,
                      validator: (value) =>
                          value.isEmpty ? 'Please enter a location' : null,
                      onChanged: (value) =>
                          setState(() => _currentLocation = value),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: textInputDecorationEmp,
                      initialValue: userData.aadharNo,
                      validator: (value) => value.isEmpty
                          ? 'Please enter an aadhar number'
                          : null,
                      onChanged: (value) =>
                          setState(() => _currentaadhar = value),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: textInputDecorationEmp,
                      initialValue: userData.workExperience,
                      validator: (value) => value.isEmpty
                          ? 'Please enter your work experience'
                          : null,
                      onChanged: (value) =>
                          setState(() => _currentworkExperience = value),
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          await DatabaseEmployeeService(uid: user.uid)
                              .updateEmployeeUserData(
                            'E',
                            _currentname ?? userData.name,
                            _currentPhone ?? userData.phoneNo,
                            _currentGender ?? userData.gender,
                            _currentaadhar ?? userData.aadharNo,
                            _currentLocation ?? userData.location,
                            _currentworkExperience ?? userData.workExperience,
                            _currentrating ?? 0,
                            _currentjobProfile ?? userData.jobProfile,
                          );
                        }
                        Navigator.pop(context);
                      },
                      color: Colors.amber,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );

          //}
          /*else {
            return emploading();
          }*/
        });
  }
}
