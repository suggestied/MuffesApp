import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:muffesapp/ad_state.dart';
import 'package:muffesapp/screens/app.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(Provider.value(
    value: adState,
    builder: (context, child) => MuffesApp(),
  ));
}

class MuffesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Muffes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        canvasColor: Colors.transparent,
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CheckAuth(),
    );
  }
}
