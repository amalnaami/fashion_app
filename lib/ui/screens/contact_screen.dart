import 'package:fashion_app/contstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui_used/login_screen.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80.h,
                color: pinkColor,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
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
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: pinkColor,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/image/face.png',
                            width: 22,
                            height: 22,
                            color: pinkColor,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: Image.asset(
                              'assets/image/insta.png',
                              width: 22,
                              height: 22,
                              color: pinkColor,
                            ),
                          ),
                          Image.asset(
                            'assets/image/twitter.png',
                            width: 22,
                            height: 22,
                            color: pinkColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 45.h),
            height: 520.h,
            // height: MediaQuery.of(context).size.height / 1.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/3770711/pexels-photo-3770711.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
