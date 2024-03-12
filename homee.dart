import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'add.dart'; // Import the AddPage
import 'select.dart'; // Import the SelectPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> data = [];

  Future<void> loadCSV() async {
    final String raw = await rootBundle.loadString('assets/data.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(raw);
    setState(() {
      data = csvTable;
    });
  }

  @override
  void initState() {
    super.initState();
    loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                'Title: ${data[index][0] ?? "No title"}'), // Check if data is available
            subtitle: Text(
                'Subtitle: ${data[index][1] ?? "No subtitle"}'), // Check if data is available
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectPage(
                    rowData: data[index] ?? [],
                    data: [],
                  ), // Pass data to SelectPage
                ),
              );
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  data.removeAt(index); // Remove item from the list
                });
                // Call function to update CSV file (to remove the item)
                updateCSVFile();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddPage()), // Navigate to AddPage
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void updateCSVFile() {
    // Write logic here to update the CSV file after removing an item
    // You need to use csv package or other suitable method to update the CSV file
  }
}
