import 'package:domestic_pal/screens/hire/hire.dart';
import 'package:domestic_pal/screens/home_customer/babysitterSearch.dart';
import 'package:domestic_pal/screens/home_customer/cookSearch.dart';
import 'package:domestic_pal/screens/home_customer/maidSearch.dart';
import 'package:domestic_pal/screens/home_customer/settings_form.dart';
import 'package:domestic_pal/screens/home_customer/show_list.dart';
import 'package:domestic_pal/services/auth_customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCustomer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/homebg2.png'),
              fit: BoxFit.cover,
            )),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: new AppBar(
                elevation: 0.0,
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
                actions: <Widget>[
                  TextButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Hire()),
                          (Route<dynamic> route) => false);
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Logout',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton.icon(
                      onPressed: () => _showSettingsPanel(),
                      icon: Icon(Icons.settings, color: Colors.black),
                      label: Text(
                        'Settings',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
                backgroundColor: Colors.transparent,
              ),
              body: new Container(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Center(
                    child: Text(
                      'Select your service',
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 70.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 20.0,
                      ),
                      SafeArea(
                        child: CupertinoButton(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0)),
                              image: DecorationImage(
                                image: AssetImage("assets/maid.png"),
                                fit: BoxFit.cover,
                              ),
                              //borderRadius: BorderRadius.circular(12),
                            ),

                            /*child: Container(
                              // margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Maids",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),*/
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ShowEmpList(job: "Maid")),
                            );
                          },
                        ),
                      ),
                      SafeArea(
                        child: CupertinoButton(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/chef.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            /*child: Container(
                              // margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                //  "Cook",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),*/
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowEmpList(
                                        job: "Cook",
                                      )),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  SafeArea(
                    child: CupertinoButton(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/baby.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        /*child: Container(
                          // margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                          alignment: Alignment.bottomRight,
                         child: Text(
                            "Baby-Sitter",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),*/
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowEmpList(
                                    job: 'Baby Sitter',
                                  )),
                        );
                      },
                    ),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
