import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class TableViewExample extends StatefulWidget {
  const TableViewExample({super.key});

  @override
  State<TableViewExample> createState() => _TableViewExampleState();
}

class _TableViewExampleState extends State<TableViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Data Table"),
      ),
      body: DataTable2(
        border: TableBorder.all(color: Colors.black),
        bottomMargin: 10,
        checkboxAlignment: Alignment.center,
        checkboxHorizontalMargin: 0,
        // columnSpacing: 20,
        // dataRowColor: const MaterialStatePropertyAll(Colors.amber),
        // empty: const Text("data"),

        columns: const [
          DataColumn2(
            label: Text('A'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('B'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('C'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('D'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('E'),
            size: ColumnSize.L,
          ),
        ],
        rows: List<DataRow>.generate(
          10,
          (index) => const DataRow(
            cells: [
              DataCell(Text('A')),
              DataCell(Text('B')),
              DataCell(Text('C')),
              DataCell(Text('D')),
              DataCell(Text('E')),
            ],
          ),
        ),
      ),
    );
  }
}
