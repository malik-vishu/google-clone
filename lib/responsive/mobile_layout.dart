import 'package:flutter/material.dart';
import 'package:google_clone/theme/color.dart';
import 'package:google_clone/widgets/search_widget.dart';
import 'package:google_clone/widgets/web/direct_buttons_widget.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        //Home Icon
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        actions: [
          //Profile Icon
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0).copyWith(right: 6),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_outline_rounded,
                  color: primaryColor,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .2,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SearchWidget(),
                    SizedBox(
                      height: size.height * .035,
                    ),
                    const DirectButtons(),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
