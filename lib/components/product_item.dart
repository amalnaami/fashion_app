import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/contstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class ProductItem extends StatelessWidget {
  String image;
  String text;
  ProductItem({this.image,this.text});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 50,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => MakeUpDetails()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3.5,
                height: 150.w,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      spreadRadius: .05,
                      blurRadius: 4,
                      offset: Offset(0, 0.5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 150.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                              image: NetworkImage(
                                  image),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 8.w,),
                    Text(
                      text,
                      style: titleStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ),
            );
          });
  }
}
