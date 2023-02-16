import 'package:cs_calculator/provider/provider_data.dart';
import 'package:cs_calculator/responsive/responsive_layout.dart';
import 'package:cs_calculator/screen/desktop_screen.dart';
import 'package:cs_calculator/screen/mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [ListenableProvider(create: (_)=>ProviderData())], child:  MaterialApp(home: MyApp()),), );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobileScreen: MobileScreen(), desktopScreen: DesktopScreen());
  }
}
