import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:domestic_pal/services/auth_employee.dart';
//import 'package:domestic_pal/services/database_employee.dart';
import 'package:provider/provider.dart';
//import 'package:domestic_pal/models/user.dart';

class ViewDetails extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {

  String image;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return  StreamBuilder<EmployeeUserData>(
        stream: DatabaseEmployeeService(uid: user.uid).empDetails,
        builder: (context, snapshot) {
          EmployeeUserData userData = snapshot.data;
          /*if(userData.jobProfile=='Cook')
            image='assets/chef.png';
          else if(userData.jobProfile=='Maid')
            image='assets/maid.png';
          else if(userData.jobProfile=='Baby Sitter')
            image='assets/baby.png';*/
          return Scaffold(
            //backgroundColor: Colors.white,
            body: Container(
              /*decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                )
              ),*/

              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 40.0, 30.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(image),
                          radius: 50.0,
                          //radius: 50.0,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      /*Divider(
                        height: 190.0,
                        color: Colors.white,
                      ),*/
                      Container(
                        //margin:EdgeInsets.zero,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 80.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            /*gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                //colors:[Color(0xffffd22e),Color(0xffdc85ff)]
                              )*/
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(width: 300.0),
                            Text(
                              'Name:',
                              style: GoogleFonts.girassol(
                                fontSize: 20.0,
                                letterSpacing: 2.0,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '${userData.name}',
                              style: GoogleFonts.alegreya(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 150.0,
                        color: Colors.white,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 80.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            /*gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                //colors:[Color(0xffffd22e),Color(0xffdc85ff)]

                            )*/
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //SizedBox(width: 300.0),
                            Text(
                              'Phone No:',
                              style: GoogleFonts.girassol(
                                fontSize: 20.0,
                                letterSpacing: 2.0,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '${userData.phoneNo}',
                              style: GoogleFonts.alegreya(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 50.0,
                        color: Colors.white,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 80.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            /*gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,

                              //colors:[Color(0xffffd22e),Color(0xffdc85ff)]
                            )*/
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //SizedBox(width: 300.0),
                            Text(
                              'Location:',
                              style: GoogleFonts.girassol(
                                fontSize: 20.0,
                                letterSpacing: 2.0,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '${userData.location}',
                              style: GoogleFonts.alegreya(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 50.0,
                        color: Colors.white,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 80.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            /*gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                //colors: [Colors.teal[100],Colors.teal[900]]
                              //colors:[Color(0xffffd22e),Color(0xffdc85ff)]
                            )*/
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //SizedBox(width: 300.0),
                            Text(
                              'Aadhar No:',
                              style: GoogleFonts.girassol(
                                fontSize: 20.0,
                                letterSpacing: 2.0,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '${userData.aadharNo}',
                              style: GoogleFonts.alegreya(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
