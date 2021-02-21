import 'package:fashion_app/backend/fashion_provider.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/model/products.dart';
import 'package:fashion_app/ui/components/custom_appbar.dart';
import 'package:fashion_app/ui/screens/ui_used/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {


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
      body: Selector<FashionProvider, List<Product>>(
        builder: (context, value, child) {
          return value.isEmpty
              ? Center(
                  child:   SpinKitFadingCube(
                    color: pinkColor,
                    // color: HexColor(cyanColor),
                    size: 50.0,
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(
                      left: 10.w, right: 10.w, bottom: 10.h, top: 30.h),
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print('namenamenamename ${value[index].departId}');
                            print('namename ${value[index].name}');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ProductDetails(value[index])));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            height: 120.w,
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  spreadRadius: .05,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 0.5), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 120.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            value[index].imageUrl,
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                Text(
                                  value[index].name,
                                  style: titleStyle.copyWith(fontSize: 13,color: brownColor),
                                ),
                                Text(
                                  value[index].price,
                                  style: titleStyle.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
        },
        selector: (x, y) {
          return y.product;
        },
      ),
    );
  }
}
