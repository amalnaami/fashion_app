import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_app/components/home_item.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/screens/dress.dart';
import 'package:fashion_app/screens/mok_up_screen.dart';
import 'package:fashion_app/screens/shoses.dart';
import 'package:fashion_app/screens/summer_cloth.dart';
import 'package:fashion_app/screens/tools.dart';
import 'package:fashion_app/screens/winter_cloths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<String> intros = [
    'https://images.pexels.com/photos/285171/pexels-photo-285171.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    'https://images.pexels.com/photos/6218357/pexels-photo-6218357.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    'https://images.pexels.com/photos/1388888/pexels-photo-1388888.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ];
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: pinkColor,
        actions: [
          InkWell(
            onTap: () {
              _drawerKey.currentState.openEndDrawer();
            },
            child: Container(
                margin: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Icon(
                  Icons.menu,
                  size: 28,
                  color: Colors.white,
                )),
          ),
        ],
        title: Text(
          translator.translate('Home'),
          style: titleStyle.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    reverse: false,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    aspectRatio: 2.0,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: [0, 1, 2].map((index) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              intros[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: .5),
                                color:
                                    (index == 0) ? pinkColor : Colors.grey[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: .5),
                                color:
                                    (index == 1) ? pinkColor : Colors.grey[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: .5),
                                color:
                                    (index == 2) ? pinkColor : Colors.grey[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 10.h,top: 10.h),
                child: Text(
                    translator.translate( 'Main sections'),
                  style: titleStyle.copyWith(
                      color: brownColor, fontWeight: FontWeight.w900),
                )),
            HomeItems(
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WinterCloth()));
                },
                image:
                    'https://images.pexels.com/photos/1381565/pexels-photo-1381565.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                name: 'Winter Clothes'),
            HomeItems(
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MakeUpScreen()));
                },
                image:
                    'https://images.pexels.com/photos/2569210/pexels-photo-2569210.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                name: 'Make Up'),
            HomeItems(
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Tools()));
                },
                image:
                    'https://upload.3dlat.com/uploads/3dlat.com_14163952178.jpeg',
                name: 'Jewelry'),
            HomeItems(
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dress()));
                },
                image:
                    'https://images.pexels.com/photos/1109596/pexels-photo-1109596.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                name: 'Dresses'),
            HomeItems(
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SummerCloth()));
                },
                image:
                    'https://images.pexels.com/photos/2761039/pexels-photo-2761039.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                name: 'Summer Clothes'),
            HomeItems(
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Shoses()));
                },
                image:
                    'https://th.bing.com/th/id/OIP.59rS7a57fMrW3Z8BLzhQHwAAAA?pid=Api&rs=1',
                name: 'Shoes')
          ],
        ),
      )),
      endDrawer: MyDrawer(),
    );
  }
}
