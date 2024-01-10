import 'package:flutter/material.dart';
import 'package:jamaya/app/config/widget/inputs/input_widget.dart';

class ReceiveItem extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<bool> onValueChanged;
  final bool value;

  const ReceiveItem({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  State<ReceiveItem> createState() => _ReceiveItemState();
}

class _ReceiveItemState extends State<ReceiveItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputWidget(
            title: 'الدور',
            label: 'الدور',
            onChange: widget.onChanged,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('دور كامل'),
            Checkbox(
              value: widget.value,
              onChanged: (value) {
                if (value == null) return;
                widget.onValueChanged(value);
                setState(() {});
              },
            ),
          ],
        )
      ],
    );
  }
}
