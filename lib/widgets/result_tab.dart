import 'package:flutter/material.dart';
import 'package:google_clone/theme/color.dart';

//Only Design no interaction implemented here
class ResultTab extends StatelessWidget {
  final String text;
  final bool selected;
  const ResultTab({super.key, required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: selected ? Colors.blue.shade800 : searchButtonColor,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          selected
              ? Container(
                  height: 2,
                  width: 40,
                  color: Colors.blue.shade800,
                )
              : Container()
        ],
      ),
    );
  }
}
