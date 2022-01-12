
import 'package:busybee_app/helpers and components/user_model.dart';
import 'package:busybee_app/main.dart';
import 'package:busybee_app/tab.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Home.dart';
import '../home2.dart';
import 'auth_service.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<UserModel?>(
        stream  : authService.user,
        builder:(_, AsyncSnapshot<UserModel?> snapshot) {
          if(snapshot.connectionState == ConnectionState.active){
            final UserModel? user = snapshot.data;
            return user == null ? HomePage(): TheTabs();
          }else{
            return Scaffold(
              body: Center(
                child : CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}