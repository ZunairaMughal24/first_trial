import 'dart:math';

import 'package:first_trial/bloc/authBloc.dart';
import 'package:first_trial/bloc/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<Authbloc>().add(LogOutRequest());
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(child: Text("You are logged in!")),
    );
  }
}
