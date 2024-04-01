import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerContainerWidget(
            height: 15,
            width: 40,
            padding:
                EdgeInsets.only(left: size.width <= 768 ? 10 : 150, top: 12)),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Container(
                    margin: EdgeInsets.only(
                      left: size.width <= 768 ? 10 : 150,
                      right: size.width <= 768 ? 10 : size.width * .48,
                      top: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ShimmerContainerWidget(height: 22, width: 30),
                                const SizedBox(
                                  height: 2,
                                ),
                                ShimmerContainerWidget(
                                    height: 14, width: size.width * .2)
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * .46,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ShimmerContainerWidget(
                                        height: 14, width: size.width * .5),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    ShimmerContainerWidget(
                                        height: 14, width: size.width * .5),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    )));
          },
        )
      ],
    );
  }
}

class ShimmerContainerWidget extends StatelessWidget {
  final double height, width;
  final EdgeInsetsGeometry? padding;
  const ShimmerContainerWidget(
      {super.key, required this.height, required this.width, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }
}
