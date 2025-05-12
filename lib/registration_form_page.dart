import 'package:flutter/material.dart';
import 'global_data.dart'; // Import the global list
import 'home_page.dart';

class RegistrationFormPage extends StatefulWidget {
  @override
  _RegistrationFormPageState createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _rollNoController = TextEditingController();
  final _hscCollegeController = TextEditingController();
  final _hscMarksController = TextEditingController();
  final _hscOutOfController = TextEditingController();
  final _bachelorCourseController = TextEditingController();
  final _bachelorCollegeController = TextEditingController();
  double _percentage = 0.0;

  void _calculatePercentage() {
    if (_hscMarksController.text.isNotEmpty && _hscOutOfController.text.isNotEmpty) {
      double marks = double.parse(_hscMarksController.text);
      double outOf = double.parse(_hscOutOfController.text);
      setState(() {
        _percentage = (marks / outOf) * 100;
      });
    } else {
      setState(() {
        _percentage = 0.0;
      });
    }
  }

  // Validate Contact Number
  String? _validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contact number is required';
    }
    if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Contact number must be 10 digits';
    }
    return null;
  }

  // Validate Roll No (UCID)
  String? _validateRollNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Roll No is required';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Roll No must contain only numbers';
    }
    return null;
  }

  // Validate Marks Obtained and Out Of
  String? _validateMarks(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'This field must contain only numbers';
    }
    return null;
  }

  // Validate Email ID
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email ID is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Save data to a map
      Map<String, dynamic> studentData = {
        'Name': _nameController.text,
        'Email ID': _emailController.text,
        'Contact': _contactController.text,
        'Roll No': _rollNoController.text,
        'HSC College': _hscCollegeController.text,
        'HSC Marks Obtained': _hscMarksController.text,
        'HSC Out Of': _hscOutOfController.text,
        'Percentage': _percentage.toStringAsFixed(2),
        'Bachelor Course': _bachelorCourseController.text,
        'Bachelor College': _bachelorCollegeController.text,
      };

      // Add student data to the global list
      students.add(studentData);

      // Clear form fields
      _formKey.currentState!.reset();
      setState(() {
        _percentage = 0.0;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Successful!')),
      );

      // Navigate to Student Details Page
      Navigator.pushNamed(
        context,
        '/studentDetails',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to TPO'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Name', _nameController, TextInputType.name),
              _buildTextField('Email ID', _emailController, TextInputType.emailAddress, validator: _validateEmail),
              _buildTextField('Contact', _contactController, TextInputType.phone, validator: _validateContact),
              _buildTextField('Roll No', _rollNoController, TextInputType.number, validator: _validateRollNo),
              _buildTextField('HSC College', _hscCollegeController, TextInputType.text),
              _buildTextField('HSC Marks Obtained', _hscMarksController, TextInputType.number, validator: _validateMarks, onChanged: (_) => _calculatePercentage()),
              _buildTextField('HSC Out Of', _hscOutOfController, TextInputType.number, validator: _validateMarks, onChanged: (_) => _calculatePercentage()),
              _buildReadOnlyField('Percentage', _percentage.toStringAsFixed(2)),
              _buildTextField('Bachelor Course', _bachelorCourseController, TextInputType.text),
              _buildTextField('Bachelor College', _bachelorCollegeController, TextInputType.text),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType keyboardType, {Function(String)? onChanged, String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: 'Enter $label',
          ),
          validator: validator,
          onChanged: onChanged,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: value,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}