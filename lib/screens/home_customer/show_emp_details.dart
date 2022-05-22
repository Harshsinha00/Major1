import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailScreen extends StatefulWidget {
  final DocumentSnapshot employee;
  DetailScreen({this.employee});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _rate, avgrating;

  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String image;
    if (widget.employee['gender'] == 'Female') {
      image = 'assets/Icon.jpg';
    } else {
      image = 'assets/Final_male.jpeg';
    }
    Color color;

    double docRating = double.parse(widget.employee['rating']);
    double currentRating = 0;

    //if(employee['jobProfile'])
    switch (widget.employee['jobProfile']) {
      case 'Maid':
        color = Colors.pink[300];
        break;
      case 'Cook':
        color = Colors.orange[300];
        break;
      case 'Baby Sitter':
        color = Colors.blue[300];
        break;
    }
    String _phone = widget.employee['phoneNo'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Employee Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 40.0,
            ),
            Divider(
              height: 30.0,
              color: Colors.grey[800],
            ),
            //SizedBox(height: 20),
            Text(
              widget.employee['name'],
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //SizedBox(width: 10.0),
                Icon(
                  Icons.location_on_outlined,
                  size: 40.0,
                  color: Colors.red[400],
                ),
                Text(
                  widget.employee['location'],
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Icon(
                  Icons.person_outline,
                  size: 40.0,
                  color: Colors.blue[400],
                ),
                SizedBox(width: 4.0),
                Text(
                  widget.employee['gender'],
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Text('Rate your experience!', style: TextStyle(fontSize: 23.0)),
            // RatingBar(),
            SmoothStarRating(
              size: 40,
              color: color,
              rating: currentRating,
              onRated: (double value) async {
                if (docRating == 0.0) {
                  avgrating = value.toString();
                } else {
                  double avg = (docRating + value) / 2;
                  avgrating = avg.toString();
                }
//zabardati ka cooment
                currentRating = value;
                await DatabaseEmployeeService(uid: widget.employee.documentID)
                    .updateEmployeeUserData(
                  'E',
                  widget.employee['name'],
                  widget.employee['phoneNo'],
                  widget.employee['gender'],
                  widget.employee['aadharNo'],
                  widget.employee['location'],
                  widget.employee['workExperience'],
                  avgrating,
                  widget.employee['jobProfile'],
                );
                // print(_rate);
              },
              borderColor: color,
              allowHalfRating: false,
            ),
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Text('Average rating: $docRating',
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
            ),
            SizedBox(
              height: 100.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () => setState(() {
                    _makePhoneCall('tel:$_phone');
                  }),
                  icon: Icon(
                    Icons.phone_rounded,
                    size: 50.0,
                    color: Colors.green[400],
                  ),
                  //const Text('Make phone call'),
                ),
                /*Text(
                  'Contact Me',
                  style: TextStyle(fontSize: 20.0),
                ),*/
                IconButton(
                  onPressed: () {
                    FlutterOpenWhatsapp.sendSingleMessage("917667054089", "");
                  },
                  //child: Text('Running on: $_platformVersion\n'),
                  icon: FaIcon(FontAwesomeIcons.whatsapp),
                  iconSize: 50.0,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
