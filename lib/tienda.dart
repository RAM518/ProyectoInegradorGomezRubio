import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabla de Productos en venta'),
      ),
      body: Center(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Precio')),
            DataColumn(label: Text('Stock')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('Galletas Marias')),
              DataCell(Text('\$20')),
              DataCell(Text('40')),
            ]),
            DataRow(cells: [
              DataCell(Text('Coca Cola')),
              DataCell(Text('\$40')),
              DataCell(Text('10')),
            ]),
            DataRow(cells: [
              DataCell(Text('Arroz')),
              DataCell(Text('\$25')),
              DataCell(Text('20')),
            ]),
            DataRow(cells: [
              DataCell(Text('Agua mineral')),
              DataCell(Text('\$20')),
              DataCell(Text('10')),
            ]),
            DataRow(cells: [
              DataCell(Text('Sabritas')),
              DataCell(Text('\$20')),
              DataCell(Text('40')),
            ]),
            DataRow(cells: [
              DataCell(Text('Frijol')),
              DataCell(Text('\$20')),
              DataCell(Text('10')),
            ]),
            DataRow(cells: [
              DataCell(Text('Yogurt')),
              DataCell(Text('\$30')),
              DataCell(Text('15')),
            ]),
          ],
        ),
      ),
    );
  }
}
