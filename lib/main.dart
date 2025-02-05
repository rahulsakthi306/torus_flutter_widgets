import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData.light(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> data = [
    {
      "empid": 2005,
      "empname": "Peer",
      "department": "Senior Developer",
      "grade": "O",
      "experience": 10,
      "totalclaims": 1200,
      "email": "peer@gmail.com",
      "status": "WaitingForApproval",
      "process_id": "cxbbjyk5vdz2je10zh9g",
    },
    {
      "empid": 2006,
      "empname": "Alex",
      "department": "Junior Developer",
      "grade": "B",
      "experience": 3,
      "totalclaims": 800,
      "email": "alex@gmail.com",
      "status": "Approved",
      "process_id": "cxbbjyk5vdz2je10zh9h",
    },
    {
      "empid": 2006,
      "empname": "Alex",
      "department": "Junior Developer",
      "grade": "B",
      "experience": 3,
      "totalclaims": 800,
      "email": "alex@gmail.com",
      "status": "Approved",
      "process_id": "cxbbjyk5vdz2je10zh9h",
    },
    {
      "empid": 2006,
      "empname": "Alex",
      "department": "Junior Developer",
      "grade": "B",
      "experience": 3,
      "totalclaims": 800,
      "email": "alex@gmail.com",
      "status": "Approved",
      "process_id": "cxbbjyk5vdz2je10zh9hgfhdgfhfdhfgjhgfhjhgjhgjghjhgjghjfhgjhgjgfhjghjghjfghjfghjfghj",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Expandable Table')),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 700, child: ExpandableTable(data: data)),
            SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
