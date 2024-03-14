import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String label;
  const CustomButton({super.key, required this.label, required this.onTap});
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      
      child: Container(
        height: 60,
        width: 350,
        decoration: BoxDecoration(color: Colors.deepOrangeAccent, borderRadius: BorderRadius.circular(12)),
        child: Center(child: Text(label)),
      ),
    );
  }
}
