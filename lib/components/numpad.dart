import 'package:flutter/material.dart';

class POSNumpad extends StatelessWidget {
  final Function(String) onButtonPressed;

  const POSNumpad({Key? key, required this.onButtonPressed}) : super(key: key);

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
          [const Icon(Icons.backspace_outlined), '0', const Icon(Icons.done)],
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
                  onButtonPressed(button);
                },
                child: Text(button),
              ),
            ),
          );
        } else if (button is Icon) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: () {
                  onButtonPressed(
                    button.icon == Icons.backspace_outlined ? 'Clear' : 'Done',
                  );
                },
                onLongPress: () {
                  onButtonPressed(
                    button.icon == Icons.backspace_outlined
                        ? 'ClearAll'
                        : 'Done',
                  );
                },
                child: button,
              ),
            ),
          );
        }
        return Container();
      }).toList(),
    );
  }
}
