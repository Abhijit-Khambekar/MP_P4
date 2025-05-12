import 'package:flutter/material.dart';
import 'global_data.dart'; // Import the global list
import 'home_page.dart';

class StudentDetailsPage extends StatefulWidget {
  @override
  _StudentDetailsPageState createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  void _deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to TPO'),
      ),
      drawer: AppDrawer(),
      body: students.isEmpty
          ? Center(child: Text('No student details available'))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${student['Name']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Email ID: ${student['Email ID']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Roll No: ${student['Roll No']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Contact: ${student['Contact']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('HSC College: ${student['HSC College']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('HSC Marks: ${student['HSC Marks Obtained']}/${student['HSC Out Of']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Percentage: ${student['Percentage']}%', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Bachelor Course: ${student['Bachelor Course']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Bachelor College: ${student['Bachelor College']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () => _deleteStudent(index),
                            child: Text('Delete'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}