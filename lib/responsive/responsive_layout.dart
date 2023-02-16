import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget desktopScreen;
  const ResponsiveLayout({Key? key, required this.mobileScreen, required this.desktopScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains){
      if(constrains.maxWidth>600) {
        //desktop layout still not designed
        return mobileScreen;
      } else {
        return mobileScreen;
      }
    });
  }
}
