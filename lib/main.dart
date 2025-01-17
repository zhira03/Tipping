import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipme/providers/ThemeProvider.dart';
import 'package:tipme/providers/TipCalModel.dart';
import 'package:tipme/widgets/amountBiller.dart';
import 'package:tipme/widgets/percentage_slider.dart';
import 'package:tipme/widgets/person_counter.dart';
import 'package:tipme/widgets/toogleThemeButton.dart';
import 'package:tipme/widgets/totalPerPerson.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TipCalModel()),
      ChangeNotifierProvider(create : (context) => ThemeProvider())
    ],
     child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>((context));
    return MaterialApp(
      title: 'TipMe',
      theme: themeProvider.currentTheme,
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
    final model = Provider.of<TipCalModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TipMe',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold
          )),
        actions: [
          ToggleThemeIcon(),
        ],
        ),
      body : Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TipPerPerson(total: model.totalPerPerson),
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
                    billAmount: model.billTotal.toStringAsFixed(2),
                    onChanged: (value){
                      model.updateBillTotal(double.parse(value));
                    }),
                  //shared bill part
                  SplittingBill(
                    personCount: model.personCount, 
                    onDecrement: (){
                      if(model.personCount > 1){
                        model.updatePersonCount(model.personCount - 1);
                      }
                    }, 
                    onIncrement: (){
                      model.updatePersonCount(model.personCount +1);
                    }),
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
                        Text("\$${(model.tipPercentage * model.billTotal).toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          )),
                      ],
                    ),
                  ),
                  Text(
                    "${(model.tipPercentage *100).round()}%",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  TipSlider(tipPercentage: model.tipPercentage, 
                  onChanged: (double value) { 
                    model.updateTipPercentage(value);
                   },),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Text("We can add random text here Maybe about the food/ restuarant",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}









