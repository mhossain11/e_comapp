import 'dart:ui';

import 'package:flutter/material.dart';
class DropDownButtons extends StatefulWidget {
  String dropdownValue = '';
    DropDownButtons({super.key,required this.dropdownValue});

  @override
  State<DropDownButtons> createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        icon: const Icon(Icons.arrow_drop_down),
        value: widget.dropdownValue,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
           // labelText: 'experience level'
          ),
          items: const [
            DropdownMenuItem(value: '',child: Text('Your slected gender',style: TextStyle(color: Colors.grey),)),
            DropdownMenuItem(value: '0',child: Text('MALE')),
            DropdownMenuItem(value: '1',child: Text('FEMALE')),

          ],
          onChanged: (String? newValue){
           setState(() {
             widget.dropdownValue = newValue!;
           });
          }),
    );
  }
}

