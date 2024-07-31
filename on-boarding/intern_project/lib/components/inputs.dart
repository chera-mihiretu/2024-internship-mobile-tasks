import 'package:flutter/material.dart';
import 'package:intern_project/constants.dart';

class CostumInput extends StatelessWidget {
  final String hint;
  final String text;
  final TextEditingController control;
  final Color? fillColor;
  final Color? borderColor;
  final int maxLine;

  const CostumInput(
      {super.key,
      required this.hint,
      required this.control,
      required this.text,
      this.fillColor,
      this.borderColor,
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
              contentPadding: EdgeInsets.zero,
              fillColor: (fillColor == null)
                  ? AppConstants.greyColor
                  : fillColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: (borderColor == null)
                    ?  Colors.transparent
                    : borderColor!,),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (borderColor == null)
                      ? AppConstants.greyColor
                      : borderColor!,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchInput extends StatelessWidget {
  final String hint;
  final TextEditingController control;
  final VoidCallback search;

  const SearchInput({
    super.key,
    required this.hint,
    required this.control,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        controller: control,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: search,
                icon: Icon(
                  Icons.arrow_forward,
                  color: AppConstants.blueColor,
                )),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstants.greyColor),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 196, 196, 196)))),
      ),
    );
  }
}
