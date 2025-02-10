import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';

class ExpandableTable extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const ExpandableTable({super.key, required this.data});

  @override
  State<ExpandableTable> createState() => _ExpandableTableState();
}

class _ExpandableTableState extends State<ExpandableTable> {
  late List<ExpandableColumn<dynamic>> headers;
  late List<ExpandableRow> rows;

  @override
  void initState() {
    super.initState();
    createDataSource();
  }

  void createDataSource() {
    headers = widget.data.isNotEmpty
        ? widget.data[0].keys.map<ExpandableColumn<dynamic>>((key) {
            return ExpandableColumn<dynamic>(
              columnTitle: key,
              columnFlex: 1,
            );
          }).toList()
        : [];

    rows = widget.data.map<ExpandableRow>((e) {
      return ExpandableRow(
        cells: e.entries.map<ExpandableCell>((entry) {
          return ExpandableCell<dynamic>(
            columnTitle: entry.key,
            value: entry.value ?? 'N/A',
          );
        }).toList(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: ExpandableThemeData(context,
          expandedBorderColor: Colors.transparent,
          paginationSize: 24,
          headerColor: const Color.fromARGB(255, 194, 182, 255),
          headerBorder: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
          evenRowColor: const Color(0xFFFFFFFF),
          rowBorder: const BorderSide(
            color: Colors.black,
            width: 0.3,
          ),
          headerSortIconColor: const Color(0xFF6c59cf),
          paginationSelectedFillColor: const Color.fromARGB(255, 194, 182, 255),
          paginationSelectedTextColor: Colors.white,
          expansionIcon: Icon(Icons.arrow_drop_down)),
      child: ExpandableDataTable(
  headers: headers,
  rows: rows,
  pageSize: 2,
  multipleExpansion: false,
  isEditable: true,
  onRowChanged: (newRow) {
    print(newRow.cells[1].value);
  },
  renderEditDialog: (row, onSuccess) => _buildEditDialog(row, onSuccess),
  visibleColumnCount: 3,
  renderExpansionContent: (row) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Table(
        border: TableBorder.all(color: Colors.grey, width: 0.5),
        columnWidths: {
          0: FixedColumnWidth(120),
          1: FixedColumnWidth(200),
        },
        children: List.generate(row.cells.length, (index) {
          final cell = row.cells[index];
          return TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: Text(
                  cell.columnTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: Text(
                  cell.value.toString(),
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ],
          );
        }),
      ),
    );
  },
),
 );
  }

  Widget _buildEditDialog(
      ExpandableRow row, Function(ExpandableRow) onSuccess) {
    final controllers = row.cells.asMap().map((index, cell) {
      return MapEntry(
          index, TextEditingController(text: cell.value.toString()));
    });

    return AlertDialog(
      title: const Text('Edit Row'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(row.cells.length, (index) {
          final columnTitle = row.cells[index].columnTitle;
          return TextField(
            controller: controllers[index],
            decoration: InputDecoration(labelText: columnTitle),
          );
        }),
      ),
      actions: [
        TextButton(
          onPressed: () {
            for (int i = 0; i < row.cells.length; i++) {
              row.cells[i].value = controllers[i]!.text;
            }
            onSuccess(row);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
