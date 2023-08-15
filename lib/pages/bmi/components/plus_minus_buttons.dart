import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, this.onPressed});

  final IconData icon;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 4.0,
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: const CircleBorder(),
      fillColor: Theme.of(context).colorScheme.primary,
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
