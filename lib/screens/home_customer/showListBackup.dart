/*import 'package:cloud_firestore/cloud_firestore.dart';
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
  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<String> _employee;
  List<String> _filterList;
List<EmployeeUserData> _employeeLocationList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return EmployeeUserData(
          
          location: doc.data['location'],
          );
    }).toList();
  }


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
            var len = snapshot.data.length;
            if (len == 0) {
              return Column(
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: Text("No employees available",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                  )
                ],
              );
            }
            List<EmployeeUserData> employee = snapshot.data.docs
                .map((doc) => EmployeeUserData(
                      location: doc.data['location'],
                    ))
                .toList();
            employee = employee
                .where((s) =>
                    s.name.toLowerCase().contains(searchKey.toLowerCase()))
                .toList();

            return Column(
              children: [
                ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    // DocumentSnapshot empdetailsSnapshot = snapshot.data.documents[index];
                    return EmployeeTile(
                        employee: snapshot.data.documents[index]);
                  },
                ),
              ],
            );
          },
        ));
  }
}
*/