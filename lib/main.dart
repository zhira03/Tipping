import 'package:flutter/material.dart';
import 'package:tipme/widgets/amountBiller.dart';
import 'package:tipme/widgets/percentage_slider.dart';
import 'package:tipme/widgets/person_counter.dart';

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
  int _personCount = 1;
  
  double _tipPercentage = 0.05;

  void _increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void _decrement() {
    setState(() {
      if (_personCount > 0) {
        _personCount = _personCount - 1;
      } else {
        _personCount = 0;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TipMe'),
        ),
      body : Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 127, 115),
                borderRadius: BorderRadius.circular(10),
                ),
              child: Column(
                children: [
                  const Text('Tip per Person', 
                      style: TextStyle(
                        fontSize: 30, 
                        color: Colors.white),
                        ),
                   Text("\$23.50", 
                      style: TextStyle(
                        fontSize: 20, 
                        color: Color.fromARGB(255, 213, 183, 183)),
                        ),
                ],
              ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 176, 187, 226),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 245, 245, 245),
                  width: 2),
                ),
              child: Column(
                children: [
                  TipBillerField(
                    billAmount: "50.00",
                    onChanged: (
                    String value) { 
                      print("Bill amount: $value");
                     },),
                  //shared bill part
                  SplittingBill(
                    personCount: _personCount, 
                    onIncrement: _increment, 
                    onDecrement: _decrement),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tip",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          )),
                        Text("\$20",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          )),
                      ],
                    ),
                  ),
                  Text(
                    "${(_tipPercentage *100).round()}%",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  TipSlider(tipPercentage: _tipPercentage, onChanged: (double value) { 
                    setState(() {
                      _tipPercentage = value.clamp(0.05, 0.45);
                    });
                   },)
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}






