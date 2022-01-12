import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'helpers and components/auth_service.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  var customerName = "";
  var phoneNumber = "";
  var state = "";
  var address = "";
  var district = "";
  var companyEconomy = "";
  DateTime? lastTransactionDate;
  var ourPreference = "";
  var transactionAmount = "";
  var ams = "";
  var alternateNumber = "";
  var comments = "";
  var amountNotRecovered = "";
  var pan = "";
  final firestoreInstance = FirebaseFirestore.instance;

  var firebaseUser = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    void _onPressed() {
      firestoreInstance.collection("User_Info").add({
        'Customer Name': customerName,
        'Email': firebaseUser,
        'Phone Number': phoneNumber,
        'State': state,
        'Address': address,
        'District': district,
        'Company Economy': companyEconomy,
        'Last transaction date': lastTransactionDate,
        'Our Preference': ourPreference,
        'Transaction Amount': transactionAmount,
        'AMS': ams,
        'Alternate Number': alternateNumber,
        'Comments': comments,
        'Amount Not Recovered': amountNotRecovered,
        'Pan': pan,
      }).then((value) {
        print(ams);
      });
    }

    String dropdownvalue = 'Select State';
    var items = [
      'Select State',
      'Jammu and Kashmir',
      'Ladakh',
      'Himachal Pradesh',
      'Punjab',
      'Haryana',
      'Uttarakhand',
      'New Delhi',
      'Uttar Pradesh',
      'Rajasthan',
      'Madhya Pradesh',
      'Bihar',
      'Jharkhand',
      'West Bengal',
      'Chhattisgarh',
      'Sikkim',
      'Assam',
      'Arunachal Pradesh',
      'Nagaland',
      'Mizoram',
      'Manipur',
      'Meghalaya',
      'Tripura',
      'Odisha',
      'Maharashtra',
      'Gujarat',
      'Andhra Pradesh',
      'Telangana',
      'Tamil Nadu',
      'Karnataka',
      'Kerala',
    ];
    dropdown() {
      return DecoratedBox(
        decoration: BoxDecoration(
            //filled: true,
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade400),
              top: BorderSide(color: Colors.grey.shade400),
              right: BorderSide(color: Colors.grey.shade400),
              left: BorderSide(color: Colors.grey.shade400),
            )),
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: DropdownButton(
              borderRadius: BorderRadius.circular(12),
              value: dropdownvalue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  state = newValue;
                });
              },
            ),
          );
        }),
      );
    }

    return Scaffold(
        //backgroundColor: Color(0xFFB9E0FF),
        appBar: AppBar(
            elevation: 1,
            brightness: Brightness.light,
            backgroundColor: Color(0xFFF7EBE8),
            title: Text("Fill Form", style: TextStyle(color: Colors.black)),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.logout_rounded,
                  color: Colors.grey.shade900,
                  size: 30,
                ),
                onPressed: () async {
                  await authService.signOut();
                },
              )
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                TextField(
                  onChanged: (test) {
                    setState(() {
                      customerName = test;
                    });
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: "Customer Name",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: false,
                  onChanged: (test) {
                    phoneNumber = test;
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                dropdown(),
                SizedBox(height: 20),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: false,
                  onChanged: (test) {
                    district = test;
                  },
                  decoration: InputDecoration(
                      hintText: "Region/District",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: false,
                  onChanged: (test) {
                    address = test;
                  },
                  keyboardType: TextInputType.multiline,
                  minLines: 1, //Normal textInputField will be displayed
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "Address",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: false,
                  onChanged: (test) {
                    companyEconomy = test;
                  },
                  decoration: InputDecoration(
                      hintText: "Company Economy",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 20),
                DateTimeFormField(
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color(0xFFE0E0E0),
                      suffixIcon: Icon(Icons.event_note),
                      labelText: 'Last Transaction Date'),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    lastTransactionDate = value;
                  },
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (test) {
                    transactionAmount = test;
                  },
                  decoration: InputDecoration(
                      hintText: "Transaction Amount",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                Text("AMS Yes or No", style: TextStyle(fontSize: 16)),
                SizedBox(height: 15),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: ['Yes', 'No'],
                  onToggle: (index) {
                    print('switched to: $index');
                    if (index == 0) {
                      ams = "Yes";
                    }
                    if (index == 1) {
                      ams = "No";
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: false,
                  onChanged: (test) {
                    alternateNumber = test;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Alternate Number",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: false,
                  onChanged: (test) {
                    comments = test;
                  },
                  decoration: InputDecoration(
                      hintText: "Comments",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: false,
                  onChanged: (test) {
                    amountNotRecovered = test;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Amount Not Recovered",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: false,
                  onChanged: (test) {
                    ourPreference = test;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Our Preference",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  obscureText: false,
                  onChanged: (test) {
                    pan = test;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "PAN",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Container(
                    padding: EdgeInsets.only(top: 4, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      onPressed: () async {
                        _onPressed();
                      },
                      color: Color(0xff0095ff),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
