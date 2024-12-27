import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPercentage,
    required this.onChanged,
  }) : _tipPercentage = tipPercentage;

  final double _tipPercentage;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _tipPercentage,
      onChanged: onChanged,
      //onChanged: (value)=>{
      //setState(() => _tipPercentage = value),
      //},
      min: 0.05,
      max: 0.45,
      //divisions: 5,
    );
  }
}
