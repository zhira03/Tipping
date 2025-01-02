import 'package:flutter/material.dart';

class TipBillerField extends StatelessWidget {
  const TipBillerField({
    super.key, required this.onChanged, required this.billAmount,
  });

  final String billAmount;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        onChanged(value);
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.attach_money),
        labelText:'Bill Amount',
        //prefix: Text('Bill Amount'),
      ),
    );
    }
  }