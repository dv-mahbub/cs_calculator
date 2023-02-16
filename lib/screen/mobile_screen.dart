import 'package:cs_calculator/provider/provider_data.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  bool isPressedButton = true;
  bool isSoundOn = true;
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ProviderData>(context);
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              //color: Colors.grey.shade200,
              height: 0.4.sh,
              width: 1.sw,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 115.w),
                    alignment: Alignment.centerLeft,
                    height: .065.sh,
                    width: 1.sw,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,

                      constraints: const BoxConstraints(),
                      icon: Icon(isSoundOn? Icons.volume_up: Icons.volume_off),
                      onPressed: (){
                        setState(() {
                          isSoundOn = !isSoundOn;
                        });
                      },
                    ),
                  ),

                  //for input field
                  Container(
                    height: 0.2.sh,
                    alignment: Alignment.bottomRight,
                    child: Text(providerData.inputText, style: TextStyle(
                        color: providerData.isEqualPressed? Colors.black12:Colors.black,
                        fontSize: providerData.isEqualPressed? 65.sp:90.sp
                    ),),
                  ),
                  Container(
                    height: 0.1.sh,
                    alignment: Alignment.bottomRight,
                    child: Text(providerData.outputText, style: TextStyle(
                        color: providerData.isEqualPressed? Colors.black:Colors.black.withOpacity(.2),
                        fontSize: providerData.isEqualPressed? 90.sp:65.sp
                    ),),
                  ),
                ],
              ),
            ),

            Container(
              height: 0.6.sh,
              width: 1.sw,
              padding: EdgeInsets.fromLTRB(10.w, 25.h, 10.w, 15.h),
              color: Colors.grey.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calButton(false, 'C'),
                      calButton(false, '%'),
                      calButton(false, '⌫'),
                      calButton(false, '÷'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calButton(true, '7'),
                      calButton(true, '8'),
                      calButton(true, '9'),
                      calButton(false, 'x'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calButton(true, '4'),
                      calButton(true, '5'),
                      calButton(true, '6'),
                      calButton(false, '-'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calButton(true, '1'),
                      calButton(true, '2'),
                      calButton(true, '3'),
                      calButton(false, '+'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calButton(true, '00'),
                      calButton(true, '0'),
                      calButton(true, '.'),
                      calButton(false, '='),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  calButton(bool isNumberButton, String buttonText){
    final providerData = Provider.of<ProviderData>(context);
    return Container(
      width: 140.w,
      height: 140.w,
      decoration: BoxDecoration(
        color: isNumberButton? Colors.grey[300] : buttonText=='='? Colors.amber : Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(70.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(-2, -2),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(2, 2),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(2, -2),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(-2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(60.w),
          onTap: () {
            setState(() {
              providerData.calculation(buttonText);
            });
          },
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 80.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
