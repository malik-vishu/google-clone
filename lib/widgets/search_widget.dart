import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/cubit/key_cubit.dart';
import 'package:google_clone/pages/result_screen.dart';
import 'package:google_clone/theme/color.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final keyCubit = BlocProvider.of<KeyCubit>(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/google-logo.png',
            height: size.height * .13,
          ),
        ),
        SizedBox(
          height: size.height * .05,
        ),
        SizedBox(
          width: size.width <= 768 ? size.width * .7 : size.width * .25,
          height: size.height * .065,
          child: SearchBar(
            controller: controller,
            onSubmitted: (value) {
              log('${keyCubit.state}->Search widget main page');
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ResultScreen(api:keyCubit.state,query: value, start: '0')));
            },
            textStyle:
                const MaterialStatePropertyAll(TextStyle(color: searchColor)),
            hintText: 'Search Google or type a URL',
            hintStyle: MaterialStatePropertyAll(TextStyle(
                color: size.width < 768 ? blueTextColor : searchColor)),
            elevation: const MaterialStatePropertyAll(1),
            backgroundColor: MaterialStatePropertyAll(
                size.width < 768 ? mobileBlueSearchColor : primaryColor),
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            leading: size.width < 768
                ? null
                : IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            api: keyCubit.state,
                                query: controller.text,
                                start: '0',
                              )));
                    },
                    icon: const Icon(
                      Icons.search,
                      color: searchButtonColor,
                    )),
            trailing: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/mic-icon.svg',
                    width: 25,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/lens-icon.svg',
                    width: 25,
                    colorFilter:
                        ColorFilter.mode(Colors.blue.shade700, BlendMode.srcIn),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
