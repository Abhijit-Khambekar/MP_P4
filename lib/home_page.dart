import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to TPO'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TPO!!! in a big, stylish, and funky font
            Text(
              'TPO!!!',
              style: GoogleFonts.pacifico(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            // Tagline
            Text(
              'Training Placement Officers!!!',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Welcome to TPO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text('Registration Form'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/registration');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Student Details'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/studentDetails');
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Company'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/company');
            },
          ),
        ],
      ),
    );
  }
}