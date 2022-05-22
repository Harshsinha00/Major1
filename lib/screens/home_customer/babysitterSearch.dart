import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:domestic_pal/screens/home_customer/employee_tile.dart';
import 'package:domestic_pal/shared/cusloading.dart';

class BabySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue[300],
          elevation: 0.0,
        title: Text("Babysitter List"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(
              context: context, delegate: DataSearch()
              );
          })
        ],
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("empDetails")
              .where("jobProfile", isEqualTo: "Baby Sitter")
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
        ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  final cities = [
    "Mumbai",
    "Raipur",
    "Lucknow",
    "Ballia",
    "New Delhi",
    "Purnea",
    "Chattisgarh",
    "Bilaspur",
    "Jaipur",
    "Pune",
    "Bangalore",
    "Indore",
    "Varanasi",
    "Bhopal",
    "Kanpur",
    "Kolkata",
    "Bihar",
    "Agra",
    "Chennai",
    "Gaziabad",
    "Noida",
    "Delhi",
    "Patna",
    "Ranchi",
    "Hyderabad",
    "Allahabad"
  ];

  final recentCities = [
    "Raipur",
    "Lucknow",
    "Ballia",
    "New Delhi",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: () {
            query = " ";
          }
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        }
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
     //return Maidlist();
     return Scaffold(
        body: StreamBuilder(
          stream: Firestore.instance
              .collection("empDetails")
              .where("jobProfile", isEqualTo: "Babysitter")
              //.where("location", isGreaterThanOrEqualTo: cities)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) return CusLoading();

            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                 DocumentSnapshot empdetailsSnapshot = snapshot.data.documents[index];
                  return EmployeeTile(employee: empdetailsSnapshot);
              },
            );
          },
        ));

    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
     final suggestionList = query.isEmpty? recentCities
     : cities.where((p) => p.startsWith(query)).toList();

     return ListView.builder(
       itemBuilder: (context, index) => ListTile(
         onTap: (){
           showResults(context);
         },
         leading: Icon(Icons.location_city),
         title: RichText(
           text: TextSpan(
             text: suggestionList[index].substring(0,query.length),
              style: TextStyle(
               color: Colors.black, 
               fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
              style: TextStyle(
               color: Colors.grey,
               ) 
              )]
            ),
          ),
        ),
       itemCount: suggestionList.length,
      );
  }
}