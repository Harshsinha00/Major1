/*import 'package:domestic_pal/screens/authenticate/authenticate_customer.dart';
import 'package:domestic_pal/screens/authenticate/authenticate_employee.dart';
import 'package:flutter/material.dart';

class Hire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lime[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Do you want to:',
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(height: 20.0),
              //FOR CUSTOMERS
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthenticateCustomer()),
                  );
                },
                minWidth: 115.0,
                color: Colors.amber[400],
                child: Text(
                  'Hire',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              //FOR EMPLOYEES
              SizedBox(height: 10.0),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthenticateEmployee()),
                  );
                },
                minWidth: 115.0,
                color: Colors.cyan[600],
                child: Text(
                  'Get hired',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ));
  }
}*/

import 'package:domestic_pal/Just_For_UI/Login.dart';
import 'package:domestic_pal/Just_For_UI/Register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domestic_pal/screens/authenticate/authenticate_customer.dart';
import 'package:domestic_pal/screens/authenticate/authenticate_employee.dart';


class Hire extends StatefulWidget {
  Hire({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HirePageState createState() => _HirePageState();
}

class _HirePageState extends State<Hire> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AuthenticateCustomer()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Hire',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AuthenticateEmployee()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Get Hired',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }


  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'domesticPal',
        style: GoogleFonts.dancingScript(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 70,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:[Color(0xffffd22e),Color(0xffdc85ff)]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              Divider(height: 5.0,indent: 30.0,color:Colors.black87,endIndent: 30.0),
              SizedBox(
                height: 70,
              ),
              Text('Do you want to',
                style: GoogleFonts.portLligatSans(
                  textStyle: Theme.of(context).textTheme.display1,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              _submitButton(),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
              //_label()
            ],
          ),
        ),
      ),
    );
  }
}
