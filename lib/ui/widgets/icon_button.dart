


import 'package:flutter/material.dart';

class CostumIconButton extends StatelessWidget {
  const CostumIconButton.customIconButton({required this.fun,required this.text,required this.icon,super.key});
  final void Function () fun;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon:  Icon(
        icon,
        color: Colors.greenAccent,
      ),
      onPressed: fun,
      label: Text(
        text,
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.black12),
      ),
    );
  }
}
