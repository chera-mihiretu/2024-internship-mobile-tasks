import 'package:flutter/material.dart';
import 'package:intern_project/constants.dart';

class FillCustomButton extends StatelessWidget {
  final VoidCallback press;
  final String label;
  const FillCustomButton({super.key,required this.press, required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FilledButton(
        onPressed: press,
        style: FilledButton.styleFrom(
            padding: const EdgeInsets.all(15) ,
            backgroundColor: AppConstants.blueColor,
            shape: RoundedRectangleBorder(
              
                borderRadius: BorderRadius.circular(5))),
        child:  Text(label),
      ),
    );
  }
}

class OutlineCustomButton extends StatelessWidget{
  final VoidCallback press;
  final String label;
  const OutlineCustomButton({super.key, required this.press, required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: OutlinedButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          foregroundColor: AppConstants.redColor,
          side: BorderSide(color: AppConstants.redColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(label),
      ),
    );
  }


}