import 'package:flutter/material.dart';

class CostumInput extends StatelessWidget {
  final String hint;
  final String text;
  final TextEditingController control;
  final int maxLine;

  const CostumInput(
      {super.key,
      required this.hint,
      required this.control,
      required this.text,
      this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: control,
            maxLines: maxLine,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 231, 231, 231),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 196, 196, 196))
              )
            ),
          ),
        ),
      ],
    );
  }
}
