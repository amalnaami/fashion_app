import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/contstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class WinterCloth extends StatefulWidget {
  @override
  _WinterClothState createState() => _WinterClothState();
}

class _WinterClothState extends State<WinterCloth> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: CustomAppbar(
        title:'Products' ,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h, top: 30.h),
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            // physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: 50,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => WinterDetails()));
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
                                  (index % 3 == 0)
                                      ? 'https://images.pexels.com/photos/1734167/pexels-photo-1734167.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                                      : 'https://images.pexels.com/photos/54203/pexels-photo-54203.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                ),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(height: 8.w,),

                      (index % 3 == 0)
                          ? Text(
                              'سكارفات شتوية',
                              style: titleStyle.copyWith(fontSize: 16),
                            )
                          : Text(
                              'جاكيت ',
                              style: titleStyle.copyWith(fontSize: 16),
                            ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
