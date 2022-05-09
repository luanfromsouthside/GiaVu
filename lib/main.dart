import 'package:flutter/material.dart';
import 'package:flutter_giavu/screens/detail.dart';
import 'package:flutter_giavu/screens/form.dart';
import 'package:flutter_giavu/screens/home.dart';
import 'package:flutter_giavu/screens/list.dart';
import 'package:flutter_giavu/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Exam',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: '$HomeScreen',
      routes: {
        '$HomeScreen':(context) => const HomeScreen(),
        '/add':(context) => const FormScreen(),
        '/update':(context) => const FormScreen(),
        '$ListScreen': (context) => const ListScreen(),
        '$DetailScreen': (context) => const DetailScreen()
      },
    );
  }
}
