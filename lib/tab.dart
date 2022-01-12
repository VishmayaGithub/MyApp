import 'package:busybee_app/home2.dart';
import 'package:busybee_app/search.dart';
import 'package:flutter/material.dart';

class TheTabs extends StatefulWidget {
  const TheTabs({Key? key}) : super(key: key);

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[


    Search(),
    HomePage2(),
  ];

  @override
  State<TheTabs> createState() => _TheTabsState();
}

class _TheTabsState extends State<TheTabs> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavBar(),
      body: Center(
        child: TheTabs._widgetOptions.elementAt(_selectedIndex),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {  _navigateToTeacher();},
      //   backgroundColor: button,
      //   child:Icon(Icons.add,),
      // ),


      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(

            icon: Icon(Icons.add_task_sharp ),
            label: 'Form',
            backgroundColor: Colors.blueGrey

        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Search",
        ),

      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
