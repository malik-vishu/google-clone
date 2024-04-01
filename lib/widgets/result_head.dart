import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/cubit/key_cubit.dart';
import 'package:google_clone/pages/result_screen.dart';
import 'package:google_clone/theme/color.dart';
import 'package:google_clone/widgets/web/more_apps_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultHead extends StatefulWidget {
  const ResultHead({super.key});

  @override
  State<ResultHead> createState() => _ResultHeadState();
}

class _ResultHeadState extends State<ResultHead> {
  TextEditingController controller = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    //Getting size of screen
    final size = MediaQuery.of(context).size;
    //Accessing initial instance (original value)
    final keyCubit = BlocProvider.of<KeyCubit>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(53, 30, 40, 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/google-logo.png',
                height: 30,
                width: 90,
              ),
              const SizedBox(
                width: 25,
              ),
              //Search Area
              SizedBox(
                width: size.width * .45,
                height: size.height * .065,
                child: SearchBar(
                  controller: controller,
                  onChanged: (value) {
                    setState(() {});
                  },
                  textStyle: const MaterialStatePropertyAll(
                      TextStyle(color: searchColor)),
                  onSubmitted: (value) {
                    // log(value);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          api:keyCubit.state,
                              query: value,
                              start: '0',
                            )));
                  },
                  hintText: 'Search Google or type a URL',
                  hintStyle: const MaterialStatePropertyAll(
                      TextStyle(color: searchColor)),
                  elevation: const MaterialStatePropertyAll(1),
                  backgroundColor: const MaterialStatePropertyAll(primaryColor),
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  trailing: [
                    //clear icon
                    controller.text != ""
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                controller.text = '';
                              });
                            },
                            icon: const Icon(
                              Icons.close_rounded,
                              color: searchButtonColor,
                            ))
                        : Container(),

                    //mic icon
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/mic-icon.svg')),

                    //search icon
                    IconButton(
                        onPressed: () {
                          // log(controller.text);
                          if (controller.text != '') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                  api:keyCubit.state,
                                      query: controller.text,
                                      start: '0',
                                    )));
                          }
                        },
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.blue.shade600,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              //Experiment icon
              size.width <= 768
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 1),
                      child: IconButton(
                        //Will launch Search labs website
                          onPressed: () async {
                            if (await canLaunchUrl(
                                Uri.parse('https://labs.google.com/search/'))) {
                              launchUrl(
                                  Uri.parse('https://labs.google.com/search/'));
                            }
                          },
                          icon: SvgPicture.asset(
                            'assets/images/experiment.svg',
                            width: 30,
                            height: 30,
                            colorFilter: const ColorFilter.mode(
                                primaryColor, BlendMode.srcIn),
                          )),
                    ),

              //More Apps
              size.width <= 768 ? Container() : const MoreAppsWidget(),

              //Profile Icon
              size.width <= 768
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0)
                          .copyWith(right: 4),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person_outline_rounded,
                            color: primaryColor,
                          )),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
