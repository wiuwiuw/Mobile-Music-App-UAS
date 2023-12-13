import 'package:flutter/material.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: TextFormField(
        style: ConstantTextStyle.stylePoppins(
          fontSize: 12, // Sesuaikan dengan ukuran yang diinginkan
          color: whiteColor,
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: ConstantTextStyle.stylePoppins(
            fontSize: 14, // Sesuaikan dengan ukuran yang diinginkan
            fontWeight: FontWeight.w300,
            color: greyColor,
          ),
          suffixIcon: const Icon(
            Icons.search,
            size: 24,
            color: greyColor,
          ),
          filled: true,
          fillColor: const Color(0xff575B5C),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Color(0xff575B5C),
            ),
          ),
        ),
      ),
    );
  }
}
