import 'package:flutter/material.dart';

class TorusListTile extends StatefulWidget {
  const TorusListTile({super.key});

  @override
  State<TorusListTile> createState() => _TorusListTileState();
}

class _TorusListTileState extends State<TorusListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key('list_tile_key'),
      leading: Icon(Icons.account_circle),
      title: Text('Title Text'),
      subtitle: Text('Subtitle Text'),
      trailing: Icon(Icons.arrow_forward),
      isThreeLine: true,
      dense: false,
      visualDensity: VisualDensity(horizontal: 0.0, vertical: 0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      style: ListTileStyle.list,
      selectedColor: Colors.blue,
      iconColor: Colors.green,
      textColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.deepPurple,
      ),
      contentPadding: EdgeInsets.all(8),
      enabled: false,
      onTap: () {
        print('Tile tapped');
      },
      onLongPress: () {
        print('Tile long pressed');
      },
      onFocusChange: (hasFocus) {
        print('Focus changed: $hasFocus');
      },
      mouseCursor: SystemMouseCursors.click,
      selected: false,
      focusColor: Colors.yellow.withOpacity(0.3),
      hoverColor: Colors.blue.withOpacity(0.1),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
      focusNode: FocusNode(),
      autofocus: false,
      tileColor: Colors.white,
      selectedTileColor: Colors.blue.shade100,
      enableFeedback: true,
      horizontalTitleGap: 16.0,
      minVerticalPadding: 16.0,
      minLeadingWidth: 40.0,
      minTileHeight: 48.0,
      titleAlignment: ListTileTitleAlignment.top,
      internalAddSemanticForOnTap: true,
    );
  }
}
