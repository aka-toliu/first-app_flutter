import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpyt => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/image.png'),
              fit: BoxFit.cover,
              opacity: 0.1,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isFull ? 'Lotado!' : 'Pode entrar!',
                    style: TextStyle(
                        fontSize: 30,
                        color: isFull ? Colors.yellow : Colors.white,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 100,
                      color: isFull ? Colors.yellow : Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: isEmpyt ? null : decrement,
                        style: TextButton.styleFrom(
                          backgroundColor: isEmpyt
                              ? Colors.white.withOpacity(0.2)
                              : Colors.white,
                          fixedSize: const Size(100, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Saiu',
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(width: 32),
                    TextButton(
                        onPressed: isFull ? null : increment,
                        style: TextButton.styleFrom(
                          backgroundColor: isFull
                              ? Colors.white.withOpacity(0.2)
                              : Colors.white,
                          fixedSize: const Size(100, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Entrou',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                )
              ],
            )));
  }
}
