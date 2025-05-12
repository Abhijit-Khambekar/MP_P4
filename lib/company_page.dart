import 'package:flutter/material.dart';
import 'global_data.dart'; // Import the global list
import 'home_page.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final _companyNameController = TextEditingController();
  final _companyDetailsController = TextEditingController();
  final _jobRoleController = TextEditingController();
  final _jobRequirementController = TextEditingController();

  void _addCompany() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Company'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField('Company Name', _companyNameController),
                _buildTextField('Company Details', _companyDetailsController),
                _buildTextField('Job Role', _jobRoleController),
                _buildTextField('Job Requirement', _jobRequirementController),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_companyNameController.text.isNotEmpty &&
                    _companyDetailsController.text.isNotEmpty &&
                    _jobRoleController.text.isNotEmpty &&
                    _jobRequirementController.text.isNotEmpty) {
                  // Save company data to a map
                  Map<String, dynamic> companyData = {
                    'Company Name': _companyNameController.text,
                    'Company Details': _companyDetailsController.text,
                    'Job Role': _jobRoleController.text,
                    'Job Requirement': _jobRequirementController.text,
                  };

                  // Add company data to the global list
                  setState(() {
                    companies.add(companyData);
                  });

                  // Clear text fields
                  _companyNameController.clear();
                  _companyDetailsController.clear();
                  _jobRoleController.clear();
                  _jobRequirementController.clear();

                  // Close the dialog
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _deleteCompany(int index) {
    setState(() {
      companies.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to TPO'),
        actions: [
          IconButton(
            onPressed: _addCompany,
            icon: Icon(Icons.add),
            tooltip: 'Add Company', // Tooltip for the button
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: companies.isEmpty
          ? Center(child: Text('No company details available'))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: companies.length,
              itemBuilder: (context, index) {
                final company = companies[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Company Name: ${company['Company Name']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Company Details: ${company['Company Details']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Job Role: ${company['Job Role']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Job Requirement: ${company['Job Requirement']}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () => _deleteCompany(index),
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $label',
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}