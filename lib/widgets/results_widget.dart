import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultsWidget extends StatefulWidget {
  final String linkToGo;
  final String showlink;
  final String text;
  final String description;
  const ResultsWidget(
      {super.key,
      required this.linkToGo,
      required this.showlink,
      required this.text,
      required this.description});

  @override
  State<ResultsWidget> createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  bool hovered = false;

  bool underline = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: AnimatedContainer(
        margin: EdgeInsets.only(
          left: size.width <= 768 ? 10 : size.width * .12,
          right: size.width <= 768 ? 10 : size.width * .48,
          top: 10,
        ),
        duration: const Duration(milliseconds: 200),
        //Detect entry and exit
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              log('Mouse entered');
              hovered = true;
            });
          },
          onExit: (event) {
            setState(() {
              log('Mouse exited');
              hovered = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: hovered
                  ? const Color.fromARGB(255, 129, 165, 232)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              //Hovering effect
              boxShadow: hovered
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )
                    ]
                  : null,
            ),
            child: Card(
              elevation: 1,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      //Specific link will be launched
                      onTap: () async {
                        if (await canLaunchUrl(Uri.parse(widget.linkToGo))) {
                          await launchUrl(Uri.parse(widget.linkToGo));
                        }
                      },
                      onHover: (it) {
                        setState(() {
                          underline = it;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Link to click
                          Text(
                            widget.text,
                            style: TextStyle(
                                overflow: TextOverflow.fade,
                                fontSize: 22,
                                //If underline is true then on hovering link will be underlined
                                decoration: underline
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                decorationColor: Colors.blue.shade800,
                                color: Colors.blue.shade800),
                          ),

                          Text(
                            widget.showlink,
                            style: const TextStyle(
                                overflow: TextOverflow.fade,
                                fontSize: 14,
                                color: Color.fromARGB(255, 134, 135, 138)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Description
                  SizedBox(
                    width: size.width * .46,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        softWrap: true,
                        widget.description,
                        style: const TextStyle(
                          overflow: TextOverflow.fade,
                          color: Color.fromARGB(255, 100, 100, 102),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
