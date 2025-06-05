import 'package:flutter/material.dart';

class ExpansionTileExample extends StatefulWidget {
  final String? title;
  final String? subTitle;
  const ExpansionTileExample({super.key, this.title, this.subTitle});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title ?? ''),
      subtitle: Text(widget.subTitle ?? ''),
      children: <Widget>[
        ListTile(title: Text('This is tile number 1'))
      ],
    );
  }
}
