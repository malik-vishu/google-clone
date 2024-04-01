import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/theme/color.dart';
import 'package:google_clone/widgets/search_widget.dart';
import 'package:google_clone/widgets/web/bottom_widget.dart';
import 'package:google_clone/widgets/web/direct_buttons_widget.dart';
import 'package:google_clone/widgets/web/more_apps_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Gmail',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.w400),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Images',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.w400),
                )),
          ),
    
          // Eperiment icon
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1),
            child: IconButton(
              //Will launch Search labs website
                onPressed: () async {
                  if (await canLaunchUrl(
                      Uri.parse('https://labs.google.com/search/'))) {
                    launchUrl(Uri.parse('https://labs.google.com/search/'));
                  }
                },
                icon: SvgPicture.asset(
                  'assets/images/experiment.svg',
                  width: 30,
                  height: 30,
                  colorFilter:
                      const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                )),
          ),
    
          //More Apps          
          const MoreAppsWidget(),
    
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
      //Center part of the first screen
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
                const BottomWidget(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
