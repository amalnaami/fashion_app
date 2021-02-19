// import 'package:fashion_app/backend/fashion_provider.dart';
// import 'package:fashion_app/backend/server.dart';
// import 'package:fashion_app/contstant.dart';
// import 'package:fashion_app/model/market.dart';
// import 'package:fashion_app/ui/components/custom_appbar.dart';
// import 'package:fashion_app/ui/components/home_item.dart';
// import 'package:fashion_app/ui/screens/depart_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/route_manager.dart';
// import 'package:provider/provider.dart';
//
// class MarketPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppbar(
//         title:'Stores' ,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Selector<FashionProvider, List<Market>>(
//           builder: (context, value, child) {
//             return value.isEmpty
//                 ? Center(
//               child:  SpinKitFadingCube(
//                 color: pinkColor,
//                 // color: HexColor(cyanColor),
//                 size: 50.0,
//               ),
//             )
//                 : ListView.builder(
//               itemCount: value.length,
//               itemBuilder: (context, index) {
//                 return HomeItems(
//                     action: () async{
//                       Provider.of<FashionProvider>(context, listen: false)
//                           .selectedMarket = value[index];
//                       await getAllMarketsProductsFromFirebase(
//                           value[index].marketId);
//                       print('value[index].marketId ${value[index].marketId}');
//                       Get.to(DepartPage(value[index].marketId));
//                     },
//                     image: value[index].logoUrl,
//                     name: value[index].userName,
//                     price: value[index].email,
//
//                 );
//
//                 //   GestureDetector(
//                 //   onTap: () async {
//                 //     Provider.of<FashionProvider>(context, listen: false)
//                 //         .selectedMarket = value[index];
//                 //     await getAllMarketsProductsFromFirebase(
//                 //         value[index].marketId);
//                 //     Get.to(ProductPage());
//                 //   },
//                 //   child: Container(
//                 //     margin:
//                 //     EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 //     decoration: BoxDecoration(
//                 //         border: Border.all(color: Colors.black)),
//                 //     child: Row(
//                 //       children: [
//                 //         Container(
//                 //           height: 100,
//                 //           width: 100,
//                 //           child: Image.network(
//                 //             value[index].logoUrl,
//                 //             fit: BoxFit.cover,
//                 //           ),
//                 //         ),
//                 //         SizedBox(
//                 //           width: 15,
//                 //         ),
//                 //         Column(
//                 //           crossAxisAlignment: CrossAxisAlignment.start,
//                 //           children: [
//                 //             Text(value[index].userName),
//                 //             Text(value[index].email),
//                 //           ],
//                 //         )
//                 //       ],
//                 //     ),
//                 //   ),
//                 // );
//               },
//             );
//           },
//           selector: (x, y) {
//             return y.markets;
//           },
//         ),
//       ),
//     );
//   }
// }
