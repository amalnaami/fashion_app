import 'package:fashion_app/contstant.dart';
import 'file:///C:/Users/AMEL/IdeaProjects/fashion_app/lib/ui/screens/ui_used/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'contact_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Image.asset('assets/image/logo.png'),
            ),
            Padding(
              padding:  EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                  top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child:
                        Text(translator.translate('Login'), style: titleStyle),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactScreen()));
                    },
                    child: Text(
                      translator.translate('Skip'),
                      style: titleStyle.copyWith(color: brownColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
