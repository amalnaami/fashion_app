import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/screens/store_login.dart';
import 'package:fashion_app/screens/user_login.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool show1 = true;
  bool show2 = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: CustomAppbar(
        title:'Login ' ,
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  translator.translate('New User'),
                  style: titleStyle.copyWith(
                      color: brownColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  translator.translate('membership'),
                  style: titleStyle.copyWith(
                      color: brownColor,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        show2 = false;
                        show1 = true;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoreLogin()));
                    },
                    child: Container(
                      width: 150.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: (show1 == true)
                                ? pinkColor.withOpacity(.50)
                                : Colors.grey[200],
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, .5), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.storefront_sharp,
                            size: 50.h,
                            color: (show1 == true) ? pinkColor : brownColor,
                          ),
                          Text(
                            translator.translate('Stores'),
                            style: titleStyle.copyWith(
                                color: (show1 == true) ? pinkColor : brownColor,
                                fontSize: 20.h,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        show1 = false;
                        show2 = true;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserLogin()));
                    },
                    child: Container(
                      width: 150.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: (show2 == true)
                                ? pinkColor.withOpacity(.50)
                                : Colors.grey[200],
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, .5), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            size: 50.h,
                            color: (show2 == true) ? pinkColor : brownColor,
                          ),
                          Text(
                            translator.translate('Clients'),
                            style: titleStyle.copyWith(
                                color: (show2 == true) ? pinkColor : brownColor,
                                fontSize: 20.h,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
