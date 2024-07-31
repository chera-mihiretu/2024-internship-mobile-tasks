
import 'package:flutter/material.dart';

class FillCustomButton extends StatelessWidget {
  final VoidCallback press;
  final String label;
  FillCustomButton({required this.press, required this.label});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FilledButton(
          onPressed: press,
          style: FilledButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child:  Text(label),
        ),
      ),
    );
  }
}

class OutlineCustomButton extends StatelessWidget{
  final VoidCallback press;
  final String label;
  OutlineCustomButton({required this.press, required this.label});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: OutlinedButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            foregroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(label),
        ),
      ),
    );
  }


}