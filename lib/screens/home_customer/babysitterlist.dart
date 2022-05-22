import 'package:domestic_pal/shared/cusloading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'employee_tile.dart';


class Babysitterlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        title: Text('Baby sitter List'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("empDetails").where("jobProfile", isEqualTo: "Baby Sitter").snapshots(),
          builder: (context, snapshot){

            if(snapshot.data == null) return CusLoading();

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
