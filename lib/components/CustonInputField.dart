import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint, label;
  final TextEditingController controller;
  const InputField({super.key, required this.hint, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled:true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }
}
