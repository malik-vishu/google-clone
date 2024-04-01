import 'package:flutter/material.dart';
import 'package:google_clone/widgets/result_tab.dart';

//Only Design no interaction implemented here
class ResultTabs extends StatelessWidget {
  const ResultTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> textList = ['All', 'Images', 'Videos', 'Shopping', 'News'];
    return SizedBox(
      height: 45,
      child: Padding(
        padding: EdgeInsets.only(left: size.width * .1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ResultTab(
              text: textList[0],
              selected: true,
            ),
            ResultTab(
              text: textList[1],
            ),
            ResultTab(
              text: textList[2],
            ),
            ResultTab(
              text: textList[3],
            ),
            ResultTab(
              text: textList[4],
            )
          ],
        ),
      ),
    );
  }
}
