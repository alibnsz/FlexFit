import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class MyTextForm extends StatefulWidget {
  final controller;
  final String hintText;
  const MyTextForm({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<MyTextForm> createState() => _MyTextFormState();
}

class _MyTextFormState extends State<MyTextForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      child: TextFormField(
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary, fontSize: 18),
        controller: widget.controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.primaryContainer,
            filled: true,
            hintText: widget.hintText,
            hintStyle: kLabelTextStyle),
        cursorColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
