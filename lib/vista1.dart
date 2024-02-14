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
        title: const Text('Menu Principal'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TiendaPage(), 
                ));
              },
              child: const Text('Tienda'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), 
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Productos'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Lista de compra'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TiendaPage extends StatelessWidget {
  const TiendaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda'),
      ),
      body: Center(
        child: Text('Tabla productos frame'),
      ),
    );
  }
}