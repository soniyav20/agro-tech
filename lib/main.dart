import 'dart:async';

import 'package:agri/services/constants.dart';
import 'package:agri/view_models/changes.dart';
import 'package:agri/views/homepage.dart';
import 'package:agri/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Changes(
        child: MaterialApp(
          theme: ThemeData.dark(), // Set the entire app theme to dark
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          title: 'Agro-Tech',
          // routes: {'/books/': (context) => const Books()},
        ),
      ),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _translateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    Timer(
      const Duration(seconds: 2),
      () async {
        if (await checklogin() == 1) {
          name = await getname();
          token = await gettoken();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => Login(),
            ),
          );
        }
      },
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _translateAnimation,
              child: SizedBox(
                height: screenSize.height * 0.5,
                width: screenSize.width * 0.5,
                child: Image.network(
                    'https://img.collegedekhocdn.com/media/img/institute/logo/rajalaxmi.png'),
              ),
            ),
          ),
          // Center(
          //   child: FadeTransition(
          //     opacity: _translateAnimation,
          //     child: const Text(
          //       '\n\n\n\n\n\n\nREC_LIBRARY',
          //       style: TextStyle(
          //         fontSize: 32.0,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
