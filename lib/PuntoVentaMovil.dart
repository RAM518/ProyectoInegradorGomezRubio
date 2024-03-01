import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(), 
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> productos = [
    {'id': '1', 'nombre': 'Galletas Marias', 'precio': '\$20', 'stock': '40'},
    {'id': '2', 'nombre': 'Coca Cola', 'precio': '\$40', 'stock': '10'},
    {'id': '3', 'nombre': 'Arroz', 'precio': '\$25', 'stock': '20'},
    {'id': '4', 'nombre': 'Agua mineral', 'precio': '\$20', 'stock': '10'},
    {'id': '5', 'nombre': 'Sabritas', 'precio': '\$20', 'stock': '40'},
    {'id': '6', 'nombre': 'Frijol', 'precio': '\$20', 'stock': '10'},
    {'id': '7', 'nombre': 'Yogurt', 'precio': '\$30', 'stock': '15'},
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 135, 197),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 0, bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Buscar...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Configuracion'),
                value: 1,
              ),
              const PopupMenuItem(
                child: Text('Mi perfil'),
                value: 2,
              ),
              const PopupMenuItem(
                child: Text('Cerrar sesion'),
                value: 3,
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TiendaTablePage(productos: productos),
                ));
              },
              child: const Text('Tienda', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProductosPage(),
                ));
              },
              child: const Text('Productos', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CarritoPage(),
                ));
              },
              child: const Text('Lista de compra', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
    );
  }
}

class TiendaTablePage extends StatelessWidget {
  final List<Map<String, String>> productos;

  const TiendaTablePage({Key? key, required this.productos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Tienda', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 20,
            columns: const [
              DataColumn(label: Text('Id')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Precio')),
              DataColumn(label: Text('Stock')),
              DataColumn(label: Text('Acciones')),
            ],
            rows: productos
                .map(
                  (producto) => DataRow(
                    cells: [
                      DataCell(Text(producto['id']!)),
                      DataCell(Text(producto['nombre']!)),
                      DataCell(Text(producto['precio']!)),
                      DataCell(Text(producto['stock']!)),
                      DataCell(
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para agregar producto al carrito
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.limeAccent,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                          ),
                          child: Icon(Icons.add, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddProductForm(agregarProducto: (id, nombre, precio, stock) {
                productos.add({'id': id, 'nombre': nombre, 'precio': precio, 'stock': stock});
              }),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProductosPage extends StatelessWidget {
  const ProductosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 159, 33, 243),
        title: const Text('Productos', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Añadir Producto'),
                      content: const Text('¿Desea añadir un producto?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); 
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddProductForm(agregarProducto: (id, nombre, precio, stock) {
                                
                                List<Map<String, dynamic>> productos = [];
                                productos.add({'id': id, 'nombre': nombre, 'precio': precio, 'stock': stock});
                              
                              }),
                            ));
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Añadir Producto'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Eliminar Producto'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
    );
  }
}

class CarritoPage extends StatelessWidget {
  const CarritoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Carrito de Compras', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Precio')),
          ],
          // Aquí iría la lógica para llenar la tabla con los productos del carrito
          // Por ahora, dejé la tabla vacía
          rows: [],
        ),
      ),
    );
  }
}

class AddProductForm extends StatelessWidget {
  final Function(String, String, String, String) agregarProducto;

  const AddProductForm({Key? key, required this.agregarProducto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController precioController = TextEditingController();
    final TextEditingController cantidadController = TextEditingController();

    return AlertDialog(
      title: const Text('Añadir Producto'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: precioController,
              decoration: const InputDecoration(labelText: 'Precio'),
            ),
            TextField(
              controller: cantidadController,
              decoration: const InputDecoration(labelText: 'Cantidad'),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            String id = idController.text;
            String nombre = nombreController.text;
            String precio = precioController.text;
            String stock = cantidadController.text;

            agregarProducto(id, nombre, precio, stock);

            Navigator.of(context).pop();
          },
          child: const Text('Guardar'),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: Colors.blue,
            onPrimary: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: Colors.blue,
            onPrimary: Colors.white,
          ),
        ),
      ],
    );
  }
}

