import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers and components/auth_service.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchKey = "";
  Stream? streamQuery;
  String? what;
  List _allResults = [];
  TextEditingController _searchController = TextEditingController();
  QuerySnapshot? snapshotData;
  bool isExecuted = false;



  @override
  void initState() {
    super.initState();


    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance
        .collection("User_Info")
        .get()
        .then((value) {
      value.docs.forEach((result) {
        //print(result.data());
      searchKey = result.data()['Customer Name'];
        //_allResults = json.decode(searchKey);
        //print(_allResults);

      });
    });







  }





  // Future queryData(String queryString) async{
  //   return FirebaseFirestore.instance
  //       .collection('UserInfo')
  //       .where('Customer Name',isGreaterThanOrEqualTo: queryString)
  //       .get().then((collectionSnapshot){
  //     retrievedData = collectionSnapshot.docs.toList();
  //     print("r : ${retrievedData}",);
  //   });
  // }
  @override


  @override
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection("User_Info").snapshots();
  Widget build(BuildContext context) {

    Widget searchedData(){
      var url = "https://cdn.icon-icons.com/icons2/2506/PNG/512/user_icon_150670.png";
      return ListView.builder(
        itemCount: snapshotData!.docs.length,
        itemBuilder: (BuildContext , int index){
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(url),

            ),
              title : Text((snapshotData!.docs[index].data() as dynamic)['Customer Name']),
            subtitle: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    "Phone Number : ${snapshotData!.docs[index]["Phone Number"]}"),
                Text(
                    "Email : ${snapshotData!.docs[index]["Email"]}. ")
                //Text("Email : ${data.docs[index]["Email"]}"),
              ],
            ),
          );
        }
      );
    }

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: TextField(
            controller: _searchController,
            onChanged: (val) => {
              what = val
              // queryData(_searchController.text).then((value){
              //   snapshotData = value;
              //   print(snapshotData);
              //   setState(() {
              //     isExecuted = true;
              //     print(isExecuted);
              //   });
              // })
            },
            decoration: const InputDecoration(
              hintText: ("Search Name"),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),



            // Expanded(
            //   child: StreamBuilder<QuerySnapshot>(
            //     stream: _searchController != null ? users : null,
            //     builder: (BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (snapshot.hasError) {
            //         return Text(
            //           "Sorry something went wrong",
            //           style: TextStyle(fontSize: 30, color: Colors.black),
            //         );
            //       }
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Text("Loading",
            //             style: TextStyle(fontSize: 25, color: Colors.black));
            //       }
            //
            //       final data = snapshot.requireData;
            //
            //       return ListView.builder(
            //         itemCount: data.size,
            //
            //         //padding: const EdgeInsets.only(bottom: 12,top:12),
            //         itemBuilder: (context, index) {
            //           return Card(
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: _searchController.text != ''
            //                   ? ListTile(
            //                       tileColor: Colors.white,
            //                       title: Center(
            //                         child: Text(
            //                           "Customer Name : ${data.docs[index]["Customer Name"]} ",
            //                           style: TextStyle(
            //                               fontSize: 16, color: Colors.black),
            //                         ),
            //                       ),
            //                       subtitle: Column(
            //                         //mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                               "Phone Number : ${data.docs[index]["Phone Number"]}"),
            //                           Text(
            //                               "Email : ${data.docs[index]["Email"]}. ")
            //                           //Text("Email : ${data.docs[index]["Email"]}"),
            //                         ],
            //                       ),
            //                     )
            //                   : Text("hello0"),
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),

          );
  }
}
