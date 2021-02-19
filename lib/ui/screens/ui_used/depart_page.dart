import 'package:fashion_app/backend/fashion_provider.dart';
import 'package:fashion_app/backend/repository.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/model/depart.dart';
import 'package:fashion_app/model/user_model.dart';
import 'package:fashion_app/ui/components/custom_appbar.dart';
import 'package:fashion_app/ui/screens/ui_used/new_product_page.dart';
import 'package:fashion_app/ui/screens/ui_used/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:fashion_app/backend/server.dart';

class DepartPage extends StatelessWidget {
  String DEPARTID;
  int indexMarket;

  DepartPage(this.DEPARTID, this.indexMarket);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Departs',
      ),
      body: Selector<FashionProvider, List<Depart>>(
        builder: (context, value, child) {
          return value.isEmpty
              ? Center(
                  child: SpinKitFadingCube(
                    color: pinkColor,
                    // color: HexColor(cyanColor),
                    size: 50.0,
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(
                      left: 10.w, right: 10.w, bottom: 10.h, top: 30.h),
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            Provider.of<FashionProvider>(context, listen: false)
                                .depart = value;
                            await getAllProductsFromFirebase(
                                value[index].departId);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: (Repository.repository.appUser.type ==
                                        userType.store )
                                ? Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200.w,
                                        margin: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[300],
                                              spreadRadius: .05,
                                              blurRadius: 4,
                                              offset: Offset(0,
                                                  0.5), // changes position of shadow
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 150.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        value[index].imageUrl,
                                                      ),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Text(
                                              value[index].name,
                                              style: titleStyle.copyWith(
                                                  fontSize: 16,
                                                  color: brownColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewProduct(
                                                          departId: value[index]
                                                              .departId)));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.add_circle,
                                            size: 40,
                                            color: brownColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200.w,
                                    margin: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[300],
                                          spreadRadius: .05,
                                          blurRadius: 4,
                                          offset: Offset(0,
                                              0.5), // changes position of shadow
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
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    value[index].imageUrl,
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Text(
                                          value[index].name,
                                          style: titleStyle.copyWith(
                                              fontSize: 16, color: brownColor),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        );
                      }),
                );
        },
        selector: (x, y) {
          return y.depart;
        },
      ),
    );
  }
}
