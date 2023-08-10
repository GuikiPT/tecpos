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
          [Icons.backspace_outlined, '0', Icons.done],
        ),
      ],
    );
  }

  Widget buildRow(BuildContext context, List<dynamic> buttons) {
    return Row(
      children: buttons.map((button) {
        if (button is String) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: () {
                  if (button == 'Clear') {
                  } else if (button == 'Done') {
                  } else {}
                },
                child: Text(button),
              ),
            ),
          );
        } else if (button is IconData) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: () {
                  if (button == Icons.clear) {
                  } else if (button == Icons.done) {
                  } else {}
                },
                child: Icon(button),
              ),
            ),
          );
        }
        return Container();
      }).toList(),
    );
  }
}
