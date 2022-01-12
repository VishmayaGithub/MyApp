import 'package:busybee_app/signup.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal : 30,vertical : 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  <Widget>[
              Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

              // SizedBox(
              //   height: 20
              // ),
              Text(
                "Busybee Busybee Busybee Busybee Busybee Busybee Busybee",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15
                ),

              ),
              Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/welcome.png')

                    )
                ),
              ),

              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    height:60,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    height:60,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    color: Color(0xff0095ff),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),

                ],
              )

            ],

          ),
        ),

      ),
    );
  }
}
