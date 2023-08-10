import 'package:flutter/material.dart';

class POSNumpad extends StatelessWidget {
  const POSNumpad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow(
          context,
          ['1', '2', '3'],
        ),
        const SizedBox(
          height: 10,
        ),
        buildRow(
          context,
          ['4', '5', '6'],
        ),
        const SizedBox(
          height: 10,
        ),
        buildRow(
          context,
          ['7', '8', '9'],
        ),
        const SizedBox(
          height: 10,
        ),
        buildRow(
          context,
          ['0'],
        ),
      ],
    );
  }

  Widget buildRow(BuildContext context, List<String> buttons) {
    return Row(
      children: buttons.map((label) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(label),
            ),
          ),
        );
      }).toList(),
    );
  }
}
