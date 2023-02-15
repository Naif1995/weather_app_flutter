import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
// final  Function(String) onChangedValue;
  final Function(String) onChangedValue;

  const CustomDropdownButton({required this.onChangedValue, super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

const List<String> list = <String>['Riyadh', 'Jeddah', 'Makha', 'Madeina'];

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(20),
          value: dropdownValue,
          iconSize: 20,
          icon: const Icon(
            Icons.keyboard_arrow_down,
          ),
          onChanged: (value) => {
            setState(() {
              dropdownValue = value.toString();
            }),
            widget.onChangedValue(value!)
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Container(
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
