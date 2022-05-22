import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domestic_pal/screens/home_customer/show_emp_details.dart';
import 'package:flutter/material.dart';

class EmployeeTile extends StatelessWidget {
  final DocumentSnapshot employee;
  EmployeeTile({this.employee});

  @override
  Widget build(BuildContext context) {
    String image;
    String _rate = employee['rating'];
    if (employee['gender'] == 'Female') {
      image = 'assets/Icon.jpg';
    } else {
      image = 'assets/Final_male.jpeg';
    }
    return Padding(
      padding: EdgeInsets.only(
        top: 8.0,
      ),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(employee: employee),
              ),
            );
          },
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown,
            backgroundImage: AssetImage(image),
          ),
          title: Text(employee['name']),
          trailing: Text('$_rate/5'),
          subtitle: Text(employee['location']),
        ),
      ),
    );
  }
}
