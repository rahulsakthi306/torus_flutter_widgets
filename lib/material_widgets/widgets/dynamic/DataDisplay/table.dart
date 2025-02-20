import 'package:flutter/material.dart';
import 'package:torus_flutter_widgets/material_widgets/widgets/customwidget/table.dart';

class Expandtable extends StatefulWidget {
  const Expandtable({super.key});

  @override
  State<Expandtable> createState() => _ExpandtableState();
}

class _ExpandtableState extends State<Expandtable> {
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
          ],
        ),
      ),
    );
  }
}