import 'package:flutter/material.dart';

class TipPerPerson extends StatelessWidget {
  const TipPerPerson({
    super.key,
    required this.total,
  });

  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 59, 127, 115),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Text(
              'Total per Person',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Text(
              "\$${total.toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 213, 183, 183)),
            ),
          ],
        ),
      ),
    );
  }
}
