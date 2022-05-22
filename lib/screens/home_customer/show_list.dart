import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/shared/cusloading.dart';
import 'package:flutter/material.dart';

import 'employee_tile.dart';

class ShowEmpList extends StatefulWidget {
  final String job;
  ShowEmpList({this.job});
  @override
  _ShowEmpListState createState() => _ShowEmpListState();
}

class _ShowEmpListState extends State<ShowEmpList> {
  var queryResultSet = [];

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (widget.job) {
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          elevation: 0.0,
          title: Text('${widget.job} List'),
        ),
        body: StreamBuilder(
          stream: Firestore.instance
              .collection("empDetails")
              .where("jobProfile", isEqualTo: widget.job)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) return CusLoading();
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                // DocumentSnapshot empdetailsSnapshot = snapshot.data.documents[index];
                return EmployeeTile(employee: snapshot.data.documents[index]);
              },
            );
          },
        ));
  }
}
