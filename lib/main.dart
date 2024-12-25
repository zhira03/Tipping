import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TipMe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TipMe(),
    );
  }
}

class TipMe extends StatefulWidget {
  const TipMe({super.key});

  @override
  State<TipMe> createState() => _TipMeState();
}

class _TipMeState extends State<TipMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TipMe'),
        ),
      body : Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 60, 95, 220),
              borderRadius: BorderRadius.circular(10),
              ),
            child: Column(
              children: [
                const Text('Tip per Person', 
                    style: TextStyle(
                      fontSize: 30, 
                      color: Colors.white),
                      ),
                const Text("\$23.50", 
                    style: TextStyle(
                      fontSize: 20, 
                      color: Color.fromARGB(255, 213, 183, 183)),
                      ),
              ],
            ),
            ),
        ]
      ),
    );
  }
}

