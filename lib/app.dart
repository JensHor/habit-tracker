import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/start_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFF2F1F5),
          textTheme: GoogleFonts.montserratTextTheme()),
      title: 'Counter App',
      home: StartPage(),
    );
  }
}
