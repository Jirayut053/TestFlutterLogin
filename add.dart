import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController timeController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: timeController,
              decoration: InputDecoration(labelText: 'Time'),
            ),
            TextField(
              controller: websiteController,
              decoration: InputDecoration(labelText: 'Website'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: commentController,
              decoration: InputDecoration(labelText: 'comment'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Save data to CSV
                saveToCSV();
                // Navigate back to previous screen
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void saveToCSV() {
    // Get values from controllers
    String time = timeController.text;
    String website = websiteController.text;
    String name = nameController.text;
    String password = passwordController.text;
    String comment = commentController.text;

    // Construct a string in CSV format
    String newData = '$time,$website,$name,$password,$comment\n';

    // Append data to existing CSV file (or create a new file if it doesn't exist)
    // You need to implement the logic to append data to the CSV file here
    // Example: Write logic using csv package to write newData to the CSV file
  }
}
