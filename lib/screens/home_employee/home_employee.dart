import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/screens/home_employee/settings_form.dart';
import 'package:domestic_pal/screens/home_employee/view.dart';
import 'package:domestic_pal/screens/hire/hire.dart';
import 'package:domestic_pal/services/auth_employee.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeEmployee extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    String image;

    _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamBuilder<EmployeeUserData>(
      stream: DatabaseEmployeeService(uid: user.uid).empDetails,
      builder: (context, snapshot) {
        EmployeeUserData userData = snapshot.data;
        if (userData.jobProfile == 'Cook')
          image = 'assets/chef.png';
        else if (userData.jobProfile == 'Maid')
          image = 'assets/maid.png';
        else if (userData.jobProfile == 'Baby Sitter')
          image = 'assets/baby.png';
        return Scaffold(
          body: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/homebg2.png'),
                fit: BoxFit.cover,
              )),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'domesticPal',
                    style: GoogleFonts.dancingScript(
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                  elevation: 0.0,
                  actions: <Widget>[
                    PopupMenuButton<String>(
                        // color: Colors.white,
                        icon: Icon(
                          Icons.menu_open,
                          color: Colors.black,
                        ),
                        onSelected: (value) async {
                          if (value == "Logout") {
                            print("logged out of employee");
                            await _auth.signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => Hire()),
                                (Route<dynamic> route) => false);
                          } else if (value == "Settings") {
                            _showSettingsPanel();
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              child: Text("Settings"),
                              value: "Settings",
                            ),
                            PopupMenuItem(
                              child: Text("Logout"),
                              value: "Logout",
                            )
                          ];
                        }),
                  ],
                ),
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
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          /*Divider(
                            height: 90.0,
                            color: Colors.grey[800],
                          ),*/
                          SizedBox(height: 60.0,),
                          Container(
                            //margin:EdgeInsets.zero,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 80.0,
                            width: 400.0,
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
                              /*  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    //colors:[Color(0xffffd22e),Color(0xffdc85ff)]
                                    colors: [
                                      Colors.teal[100],
                                      Colors.teal[900]
                                    ])*/
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
                            height: 50.0,
                            color: Colors.white,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 80.0,
                            width: 400.0,
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
                              /* gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    //colors:[Color(0xffffd22e),Color(0xffdc85ff)]
                                    colors: [
                                      Colors.teal[100],
                                      Colors.teal[900]
                                    ])*/
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(2, 4),
                                    blurRadius: 5,
                                    spreadRadius: 2)
                              ],
                              /* gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.teal[100], Colors.teal[900]]
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                    colors: [Colors.teal[100], Colors.teal[900]]
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
              ),
            ),
          ]),
        );
      },
    );
  }
}

/*class HomeEmployee extends StatefulWidget {
  @override
  _HomeEmployeeState createState() => _HomeEmployeeState();
}

class _HomeEmployeeState extends State<HomeEmployee> {
  int index = 0;
  List<Widget> list = [
    ViewDetails(),
    UpdateDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan[50],
        appBar: AppBar(
          title: Text("Employee Home Screen"),
          backgroundColor: Colors.cyan[800],
        ),
        body: list[index],
        drawer: MyDrawer(
          onTap: (ctx, i) {
            setState(() {
              index = i;
              Navigator.pop(ctx);
            });
          },
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;
  final AuthService _auth = AuthService();

  MyDrawer({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Username from firebase',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Mail ID from firebase',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text('View Details'),
              onTap: () => onTap(context, 0),
            ),
            ListTile(
              leading: Icon(Icons.update_outlined),
              title: Text('Update Details'),
              onTap: () => onTap(context, 1),
            ),
            Divider(height: 1),
            ListTile(
                leading: FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                print("logged out of employee");
                await _auth.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Hire()),
                    (Route<dynamic> route) => false);
              },
            )),
          ],
        ),
      ),
    );
  }
}*/
