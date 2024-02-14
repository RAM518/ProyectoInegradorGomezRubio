import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'p;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: '',
      ),
      title: 'Punto de venta',
    );
  }
}
class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int cont = 0;
  void suma() {
    cont++;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),   
            Image.asset(
              'assets/imagen.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 15,
                    ),
                    child: const Icon(
                      Icons.code,
                      color: Color.fromARGB(255, 1, 124, 255),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(35),
                    ),
                  ),
                  labelText: 'Correo',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 15,
                    ),
                    child: const Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 1, 124, 255),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(35),
                    ),
           ),
                  labelText: 'Contraseña',
          ),
           ),
            ),
         const SizedBox(
           height: 20,
      ),
            ElevatedButton.icon(
             onPressed: () {},
         label: const Text('Login'),
              icon: const Icon(
           Icons.login,
              ),
      style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(35),
                ),
          padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                backgroundColor: const Color.fromARGB(255, 235, 237, 240),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Olvide mi contraseña'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 181, 181, 181),
                    // width: 150,
                    height: 1,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Or'),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 181, 181, 181),
                    // width: 150,
                    height: 1,
                  ),
                ),
    ],
   ),
    const SizedBox(
     height: 15,
  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 2, 124, 255),
                        width: 1,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(
                    EvaIcons.facebook,
                    color: Color.fromARGB(255, 2, 124, 255),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 2, 124, 255),
                        width: 1,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(
    EvaIcons.twitter,
   color: Color.fromARGB(255, 2, 124, 255),
    ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 1, 124, 255),
                        width: 1,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(
                    EvaIcons.google,
                    color: Color.fromARGB(255, 1, 124, 255),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}