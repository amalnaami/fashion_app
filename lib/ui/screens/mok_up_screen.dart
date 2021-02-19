import 'package:fashion_app/ui/components/custom_appbar.dart';
import 'package:fashion_app/ui/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeUpScreen extends StatefulWidget {
  @override
  _MakeUpScreenState createState() => _MakeUpScreenState();
}

class _MakeUpScreenState extends State<MakeUpScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Products',
      ),
      body: Container(
        margin:
            EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h, top: 30.h),
        height: MediaQuery.of(context).size.height,
        child: ProductItem(
            text: 'ميك أب ',
            image:
                'https://images.pexels.com/photos/1926620/pexels-photo-1926620.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
      ),
    );
  }
}
