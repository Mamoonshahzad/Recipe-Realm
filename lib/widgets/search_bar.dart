import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReUsableSearchBar extends StatefulWidget {
  const ReUsableSearchBar({super.key});

  @override
  State<ReUsableSearchBar> createState() => _ReUsableSearchBarState();
}

class _ReUsableSearchBarState extends State<ReUsableSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Get.width * .16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.red, blurRadius: 6),
          ],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search),
            hintText: 'search',
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red.shade500),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.tealAccent),
            ),
          ),
        ),
      ),
    );
  }
}
