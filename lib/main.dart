import 'package:firebase_core/firebase_core.dart';
import 'package:first_trial/bloc/authBloc.dart';
import 'package:first_trial/repository/repository.dart';
import 'package:first_trial/services/firebase_Services.dart';

import 'package:first_trial/widgets/BeautifulView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Authbloc(AuthRepository(FirebaseAuthService())),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Beautiful View',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: BeautifulView()),
    );
  }
}
