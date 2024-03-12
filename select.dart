import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  final List<dynamic> rowData;

  SelectPage({required this.rowData, required List data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date: ${rowData[0]}', style: TextStyle(fontSize: 20)),
          Text('Website: ${rowData[1]}', style: TextStyle(fontSize: 20)),
          Text('User: ${rowData[2]}', style: TextStyle(fontSize: 20)),
          Text('Password: ${rowData[3]}', style: TextStyle(fontSize: 20)),
          Text('Comment: ${rowData[4]}', style: TextStyle(fontSize: 20)),

          // Add more Text widgets for other columns if needed
        ],
      ),
    );
  }
}
