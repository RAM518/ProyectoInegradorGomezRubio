import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
      title: 'Punto de venta',
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Image.asset(
            'assets/imagen.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 30),
          const CustomTextField(
            prefixIcon: Icons.code,
            labelText: 'Correo',
          ),
          const SizedBox(height: 20),
          const CustomTextField(
            prefixIcon: Icons.lock,
            labelText: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('Login'),
            icon: const Icon(Icons.login),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              backgroundColor: const Color.fromARGB(255, 235, 237, 240),
            ),
          ),
          const SizedBox(height: 30),
          const Text('Olvidé mi contraseña'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: const Divider(color: Color.fromARGB(255, 181, 181, 181))),
              const SizedBox(width: 10),
              const Text('Or'),
              const SizedBox(width: 10),
              Expanded(child: const Divider(color: Color.fromARGB(255, 181, 181, 181))),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(icon: EvaIcons.facebook, onPressed: () {}),
              const SizedBox(width: 10),
              SocialButton(icon: EvaIcons.twitter, onPressed: () {}),
              const SizedBox(width: 10),
              SocialButton(icon: EvaIcons.google, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String labelText;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: const EdgeInsets.only(left: 20, right: 15),
            child: Icon(
              prefixIcon,
              color: const Color.fromARGB(255, 1, 124, 255),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const CircleBorder(
          side: BorderSide(color: Color.fromARGB(255, 2, 124, 255), width: 1),
        ),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(20),
      ),
      child: Icon(
        icon,
        color: const Color.fromARGB(255, 2, 124, 255),
      ),
    );
  }
}
