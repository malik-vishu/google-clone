import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/theme/color.dart';

class MoreAppsWidget extends StatefulWidget {
  const MoreAppsWidget({super.key});

  @override
  State<MoreAppsWidget> createState() => _MoreAppsWidgetState();
}

class _MoreAppsWidgetState extends State<MoreAppsWidget> {
  void _showOverlay() async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry? overlay1;
    //Icon as Box
    final renderBox = context.findRenderObject() as RenderBox;
    //More apps Icon size
    final _size = renderBox.size;
    //Setting origin
    final offset = renderBox.localToGlobal(Offset.zero);

    void hideOverlay() {
      overlay1?.remove();
      setState(() {
        overlay1 = null;
      });
    }

    Widget overLay() => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 88, 87, 87),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: 300,
            height: 380,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              width: 298,
              height: 378,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return MoreAppsIcon(
                        asset: asset[index],
                        text: name[index],
                      );
                    })
              ]),
            )));
    overlay1 = OverlayEntry(builder: (context) {
      return Stack(children: [
        GestureDetector(
          onTap: () => hideOverlay(),
          child: Container(
            color: Colors.transparent, // Make it invisible
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        //Positioning overlay
        Positioned(
            left: offset.dx - 290,
            top: offset.dy + _size.height + 4,
            child: overLay()),
      ]);
    });

    overlayState.insert(overlay1!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1),
      child: IconButton(
          onPressed: () {
            _showOverlay();
          },
          icon: SvgPicture.asset(
            'assets/images/apps-icon.svg',
            width: 30,
            height: 30,
            colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
          )),
    );
  }
}

//Scope of improvement
class MoreAppsIcon extends StatelessWidget {
  final String asset;
  final String text;
  const MoreAppsIcon({
    super.key,
    required this.asset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      height: 90,
      width: 90,
      child: TextButton(
          style: const ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                asset,
                width: 60,
                height: 20,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                text,
                style: const TextStyle(color: primaryColor, fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )),
    );
  }
}

String p = 'assets/images/';
List<String> asset = ['${p}gmail.png', '${p}youtube-icon.png'];
List<String> name = ['Gmail', 'YouTube'];
