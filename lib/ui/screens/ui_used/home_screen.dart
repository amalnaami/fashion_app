import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_app/backend/fashion_provider.dart';
import 'package:fashion_app/backend/server.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/model/market.dart';
import 'package:fashion_app/ui/components/home_item.dart';
import 'package:fashion_app/ui/screens/shoses.dart';
import 'package:fashion_app/ui/screens/summer_cloth.dart';
import 'package:fashion_app/ui/screens/tools.dart';
import 'package:fashion_app/ui/screens/ui_used/depart_page.dart';
import 'package:fashion_app/ui/screens/winter_cloths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import 'drawer_screen.dart';
import '../dress.dart';
import '../market_page.dart';
import '../mok_up_screen.dart';

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
      body: Padding(
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
                translator.translate( 'Main Stores'),
              style: titleStyle.copyWith(
                  color: brownColor, fontWeight: FontWeight.w900),
            )),
        Expanded(
          child: Selector<FashionProvider, List<Market>>(
            builder: (context, value, child) {
              return value.isEmpty
                  ? Center(
                child:  SpinKitFadingCube(
                  color: pinkColor,
                  size: 50.0,
                ),
              )
                  : ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return HomeItems(
                    action: () async{
                      Provider.of<FashionProvider>(context, listen: false)
                          .selectedMarket = value[index];
                      await getAllMarketsProductsFromFirebase(
                          value[index].marketId);
                      Get.to(DepartPage(value[index].marketId,index));
                    },
                    image: value[index].logoUrl,
                    name: value[index].userName,
                    price: value[index].email,

                  );

                },
              );
            },
            selector: (x, y) {
              return y.markets;
            },
          ),
        ),
      ],
        ),
      ),
      endDrawer: MyDrawer(),
    );
  }
}
