import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.readOnly = false,
    this.keyboardType,
  });

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kolom tidak boleh kosong';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 6),
          TextFormField(
            readOnly: readOnly!,
            cursorColor: Colors.black,
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            validator: validator ?? _defaultValidator,
          ),
        ],
      ),
    );
  }
}
