import 'package:flutter/material.dart';

class LabeledTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry contentPadding;
  final Color backgroundColor;
  final Color labelColor;
  final Color hintColor;

  LabeledTextField({
    required this.label,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    this.backgroundColor = Colors.white,
    this.labelColor = Colors.black,
    this.hintColor = Colors.grey,
  });

  @override
  _LabeledTextFieldState createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
late  bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 38, 71, 125).withOpacity(0.5),
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              fontSize: 16,
              color: widget.labelColor,
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 15,
              color: widget.hintColor,
              fontWeight: FontWeight.normal,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            filled: true,
            fillColor: widget.backgroundColor,
            contentPadding: widget.contentPadding,
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
