import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/screens/home_customer/home_customer.dart';
import 'package:domestic_pal/services/database_customer.dart';
import 'package:flutter/material.dart';
import 'package:domestic_pal/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateCustomerDetails extends StatefulWidget {
  @override
  _UpdateCustomerDetailsState createState() => _UpdateCustomerDetailsState();
}

class _UpdateCustomerDetailsState extends State<UpdateCustomerDetails> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _phonenumber;
  String _city;
  //String error = '';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<CustomerUserData>(
        stream: DatabaseCustomerService(uid: user.uid).customerUserData,
        builder: (context, snapshot) {
          CustomerUserData userData = snapshot.data;
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.purple[200],
            //   elevation: 0.0,
            //   title: Text(
            //     'domesticPal',
            //      style: TextStyle(color: Colors.black, fontSize: 20.0),
            //     ),
            // ),
            body: SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 180.0, horizontal: 50.0),
                // constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/bg3.png'),
                  fit: BoxFit.cover,
                )),

                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 90.0,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: '  domesticPal',
                            style: GoogleFonts.dancingScript(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 60,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87)),
                      ),
                      SizedBox(height: 40.0),
                      Text(
                        'Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              //labelText: 'Name',
                              //hintText: 'Enter name'
                              ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() => _name = val);
                          }),
                      SizedBox(height: 20.0),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              //labelText: "Phone",
                              //hintText: 'Enter phone number'
                              ),
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          validator: (val) => val.length < 10
                              ? 'Enter a phone number 10 chars long'
                              : null,
                          onChanged: (val) {
                            setState(() {
                              _phonenumber = val;
                            });
                          }),
                      SizedBox(height: 20.0),
                      Text(
                        'City',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              //labelText: 'City',
                              //hintText: 'Enter city'
                              ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a city' : null,
                          onChanged: (val) {
                            setState(() => _city = val);
                          }),
                      SizedBox(height: 30.0),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseCustomerService(uid: user.uid)
                                .updateCustomerUserData(
                                    'C',
                                    _name ?? userData.name,
                                    _phonenumber ?? userData.phone,
                                    _city ?? userData.city);
                          }
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomeCustomer()),
                              (Route<dynamic> route) => false);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                  colors: [
                                    Color(0xffffd22e),
                                    Color(0xffdc85ff)
                                  ])),
                          child: Text(
                            'Register',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
