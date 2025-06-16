import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.obscureText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isObscured,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFC4C4C4).withOpacity(0.2),
          hintText: widget.hintText,
          hintStyle: AppFonts.font14light,
          prefixIcon: Icon(widget.icon, color: Colors.black.withOpacity(0.5)),
          suffixIcon:
              widget.obscureText
                  ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey[700],
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                  : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
