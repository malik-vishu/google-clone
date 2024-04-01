import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_clone/cubit/key_cubit.dart';
import 'package:google_clone/pages/api_key_screen.dart';
import 'package:google_clone/pages/result_screen.dart';
import 'package:google_clone/responsive/mobile_layout.dart';
import 'package:google_clone/responsive/responsive_layout_widget.dart';
import 'package:google_clone/responsive/web_layout.dart';
import 'package:google_clone/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => KeyCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: backgroundColor,
              textTheme: TextTheme(
                bodyMedium: GoogleFonts.chakraPetch(),
              )),
          title: 'Google Clone',
          // home: const ResponsiveWidget(
          //     mobileScreenLayout: MobileScreenLayout(),
          //     webScreenLayout: WebScreenLayout()),
          // home: const ResultScreen(
          //   api: '',
          //   query: '',
          //   start: '0',
          // )
          home: ApiKeyScreen(),
        ));
  }
}
