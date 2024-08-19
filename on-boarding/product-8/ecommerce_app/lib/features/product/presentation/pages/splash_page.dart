import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/themes/themes.dart';
import '../../../auth/presentation/page/login_page.dart';

class SplashPage extends StatefulWidget {
  static const String routes = '/splash_page';
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
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
    return const Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/image.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  MyTheme.ecBlue,
                  Color.fromARGB(193, 63, 81, 243),
                  Color.fromARGB(117, 63, 81, 243)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Text(
                  'ECCOMMERCE APP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
