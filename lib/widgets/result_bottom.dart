import 'package:flutter/material.dart';
import 'package:google_clone/theme/color.dart';

class ResultBottom extends StatelessWidget {
  const ResultBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(
              horizontal: size.width <= 768 ? 10 : size.width * .12,
              vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                  direction:
                      size.width <= 768 ? Axis.vertical : Axis.horizontal,
                  children: [
                    Text(
                      'India',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: 0.5,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.circle,
                      color: Color(0xFF70757A),
                      size: 12,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '248002, Dehradun, Uttarakhand',
                      style: TextStyle(
                        fontSize: 14,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      ' - From your IP address - Update location',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ])
            ],
          ),
        ),
      ],
    );
  }
}
