import 'package:flutter/material.dart';
import 'home_page.dart';
import 'registration_form_page.dart';
import 'student_details_page.dart';
import 'company_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TPO App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/registration': (context) => RegistrationFormPage(),
        '/studentDetails': (context) => StudentDetailsPage(),
        '/company': (context) => CompanyPage(),
      },
    );
  }
}