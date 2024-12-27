import 'package:flutter/material.dart';

class SplittingBill extends StatelessWidget {
  const SplittingBill({
    super.key,
    required int personCount,
    required this.onIncrement,
    required this.onDecrement,
  }) : _personCount = personCount;

  final int _personCount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Split bill",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onDecrement,
              ),
              Text("$_personCount"),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onIncrement,
              )
            ],
          )
        ],
      ),
    );
  }
}

