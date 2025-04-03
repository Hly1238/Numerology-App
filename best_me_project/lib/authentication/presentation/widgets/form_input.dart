import 'package:best_me_project/core/constants/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    required this.textController,
    required this.textFocusNode,
    required this.hintText,
    required this.icon,
  });

  final TextEditingController textController;
  final FocusNode textFocusNode;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.lightgray,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: CustomColor.darkgray,
          width: 0.5,
        ),
      ),
      child: TextFormField(
        controller: textController,
        focusNode: textFocusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.inter().copyWith(
            fontSize: 17.0,
            color: CustomColor.darkgray,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              icon,
              color: CustomColor.darkgray,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColor.bordergray,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 2.0,
          ),
        ),
      ),
    );
  }
}
