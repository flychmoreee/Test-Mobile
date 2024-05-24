import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_apk_sekolah/screens/regis_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => RegistrationPage(),
      ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Positioned(
            top: 500.0, 
            left: 0.0, 
            right: 0.0, 
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                width: 200.0, 
                height: 200.0, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
