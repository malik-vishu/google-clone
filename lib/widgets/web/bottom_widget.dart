import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Customize Chrome icon at lower right corner on first screen after entering key
class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(2),
                backgroundColor:
                    MaterialStatePropertyAll(Colors.blue.shade900)),
            onPressed: () {},
            child: const Row(children: [
              Icon(
                CupertinoIcons.pencil,
                size: 20,
                color: Color.fromARGB(194, 208, 239, 239),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'Customize Chrome',
                style: TextStyle(
                    color: Color.fromARGB(194, 208, 239, 239),
                    fontWeight: FontWeight.w400),
              )
            ]),
          ),
        )
      ],
    );
  }
}
