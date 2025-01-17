import 'package:flutter/material.dart';

class TipCalModel with ChangeNotifier{
  int _personCount = 1;
  double _billTotal = 0.00;
  double _tipPercentage = 0.05;

  double get billTotal => _billTotal;
  double get tipPercentage => _tipPercentage;
  int get personCount => _personCount;


  void updateBillTotal(double billTotal){
    _billTotal = billTotal;
    notifyListeners();
  }

  void updateTipPercentage(double tipPercentage){
    _tipPercentage = tipPercentage;
    notifyListeners();
  }

  void updatePersonCount(int personCount){
    _personCount = personCount;
    notifyListeners();
  }

  double get totalPerPerson{
    return ((_billTotal * _tipPercentage) + (_billTotal)) / _personCount;
  }
}