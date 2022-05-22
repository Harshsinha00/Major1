import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/screens/home_employee/home_employee.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:domestic_pal/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateEmployeeDetails extends StatefulWidget {
  @override
  _UpdateEmployeeDetailsState createState() => _UpdateEmployeeDetailsState();
}

class _UpdateEmployeeDetailsState extends State<UpdateEmployeeDetails> {
  final _formKey = GlobalKey<FormState>();
  final List<String> genders = ['Female', 'Male', 'Others'];
  final List<String> jobs = ['Maid', 'Cook', 'Baby Sitter'];

  String _name;
  String _phone;
  String _aadhar;
  String _location;
  String _gender;
  String _workExperience;
  String _rating;
  String _jobProfile;



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<EmployeeUserData>(
        stream: DatabaseEmployeeService(uid: user.uid).empDetails,
        builder: (context, snapshot) {
          EmployeeUserData userData = snapshot.data;
          return Scaffold(
            /*appBar: AppBar(
              backgroundColor: Colors.cyan[900],
              elevation: 0.0,
              title: Text('domesticPal'),
            ),*/
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                 decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg3.png'),
                    fit: BoxFit.cover,
                )),
                 
              
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 80.0),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'domesticPal',
                            style: GoogleFonts.dancingScript(
                                textStyle: Theme.of(context).textTheme.headline4,
                                fontSize: 60,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87
                            )
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            //SizedBox(height: 10),
                            //name
                            TextFormField(
                              decoration:
                              InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                              ),

                              validator: (val) => val.isEmpty ? 'Enter a name' : null,
                              onChanged: (val) {
                                setState(() {
                                  _name = val;
                                });
                              },
                            ),
                          ],
                        )
                      ),

                      SizedBox(height: 5.0),
                      Container(
                        margin:EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Phone Number',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            //SizedBox(height: 10,),
                            TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                              ),
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              validator: (val) => val.length < 10
                                  ? 'Enter a valid Phone Number'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  _phone = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5.0),
                      Container(
                          margin:EdgeInsets.symmetric(vertical: 10),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Aadhar Number',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                             // SizedBox(height: 10),
                              TextFormField(
                                decoration:
                                InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                ),
                                  maxLength: 12,
                                  validator: (val) =>
                                  val.isEmpty ? 'Enter the aadhar no' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      _aadhar = val;
                                    });
                                  }
                              ),
                            ],
                          )

                      ),

                      SizedBox(height: 5.0),
                      //gender drop down
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Gender',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            //SizedBox(height: 10),
                            DropdownButtonFormField(
                              decoration:
                              InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                              ),
                              items: genders.map((gender) {
                                return DropdownMenuItem(
                                  value: gender,
                                  child: Text('$gender'),
                                );
                              }).toList(),
                              onChanged: (val) => setState(() => _gender = val),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5.0),
                      Container(
                          margin:EdgeInsets.symmetric(vertical: 10),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'City',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              //SizedBox(height: 10),
                              TextFormField(
                                decoration:
                                InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                ),
                                validator: (val) =>
                                val.isEmpty ? 'Enter the city' : null,
                                onChanged: (val) {
                                  setState(() {
                                    _location = val;
                                  });
                                },
                              ),
                            ],
                          )

                      ),
                      //Location
                      SizedBox(height: 5.0),
                      //job profile dropdown
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Select Job Profile',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            //SizedBox(height: 10),
                            DropdownButtonFormField(
                              decoration:
                              InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                              ),
                              items: jobs.map((job) {
                                return DropdownMenuItem(
                                  value: job,
                                  child: Text('$job'),
                                );
                              }).toList(),
                              onChanged: (val) => setState(() => _jobProfile = val),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5.0),
                      Container(
                          margin:EdgeInsets.symmetric(vertical: 10),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Work Experience',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              //SizedBox(height: 10),
                              TextFormField(
                                decoration:
                                InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange, width: 2.0)),
                                ),
                                validator: (val) =>
                                val.isEmpty ? 'Enter the Work Experience' : null,
                                onChanged: (val) {
                                  setState(() {
                                    _workExperience = val;
                                  });
                                },
                              ),
                            ],
                          )

                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseEmployeeService(uid: user.uid)
                                .updateEmployeeUserData(
                              'E',
                              _name ?? userData.name,
                              _phone ?? userData.phoneNo,
                              _gender ?? userData.gender,
                              _aadhar ?? userData.aadharNo,
                              _location ?? userData.location,
                              _workExperience ?? userData.workExperience,
                              _rating ?? '0.0',
                              _jobProfile ?? userData.jobProfile,
                            );
                          }
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomeEmployee()),
                              (Route<dynamic> route) => false);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(2, 4),
                                    blurRadius: 5,
                                    spreadRadius: 2)
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors:[Color(0xffffd22e),Color(0xffdc85ff)]
                              )),
                          child: Text(
                            'Register',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
