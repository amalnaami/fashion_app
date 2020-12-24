import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);

    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);

    // Future.delayed(Duration(seconds: 4)).then((value){
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => SplashScreen()));
    // });

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top:120.h),
                width: 200.w,
                height: 200.h,
                child: Image.asset(
                  "assets/image/logo.png",
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: 20.h, right: 20.w, bottom: 20.h),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 10,
                      child: Container(
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                  bottom: 20.h,
                                  top: 20.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    translator.translate(
                                        "Please choose the app language"),
                                    style: titleStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10.h)),
                                  OutlineButton(
                                    onPressed: () {
                                      translator.setNewLanguage(
                                        context,
                                        newLanguage:
                                            translator.currentLanguage == 'ar'
                                                ? 'en'
                                                : 'ar',
                                        remember: true,
                                        restart: true,
                                      );
                                    },
                                    child: Text(
                                      translator.translate(
                                          'Choose language by click here'),
                                      style: titleStyle.copyWith(
                                          fontSize: 16,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10.h)),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SplashScreen()));
                                      },
                                      child: Text(
                                        'NEXT',
                                        style:
                                            titleStyle.copyWith(fontSize: 18),
                                      ))
                                ],
                              )))))
            ],
          ),
        ));
  }
}
