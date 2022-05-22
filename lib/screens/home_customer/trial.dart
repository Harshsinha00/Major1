/*import 'package:domestic_pal/shared/cusloading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'employee_tile.dart';

class ShowEmployeeList extends StatefulWidget {
  @override
  _ShowEmployeeListState createState() => _ShowEmployeeListState();
}

class _ShowEmployeeListState extends State<ShowEmployeeList> {
  TextEditingController _searchController = TextEditingController();


Future resultsLoaded
  List _allResults = [];
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  _onSearchChanged() {
    print(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  getEmployeeSnapshots() async {
    var data = await Firestore.instance
        .collection('empDetails')
        .where('jobProfile', isEqualTo: 'Babysitter')
        .getDocuments();
    setState(() {
      _allResults = data.documents;
    });
    return "complete";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          elevation: 0.0,
          title: Text('Baby sitter List'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection("empDetails")
                    .where("jobProfile", isEqualTo: "Baby Sitter")
                    .orderBy('rating')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) return CusLoading();

                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot empdetailsSnapshot =
                          snapshot.data.documents[index];
                      return EmployeeTile(employee: empdetailsSnapshot);
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
*/