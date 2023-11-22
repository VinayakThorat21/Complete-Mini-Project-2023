import 'package:flutter/material.dart';

class Datagram extends StatelessWidget {
  const Datagram({
    super.key,
    required this.label,
    this.onInput,
  });

  final String label;
  final void Function(String)? onInput;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onInput,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
