import 'package:flutter/material.dart';
import 'package:google_clone/theme/color.dart';

class DirectButtons extends StatelessWidget {
  const DirectButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue.shade900),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: directButtonTextColor,
                      size: 30,
                    ))),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'Add Shortcut',
                style: TextStyle(fontSize: 12, color: directButtonTextColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
