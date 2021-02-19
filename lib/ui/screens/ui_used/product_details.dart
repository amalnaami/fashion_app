import 'package:fashion_app/backend/fashion_provider.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/model/depart.dart';
import 'package:fashion_app/model/products.dart';
import 'package:fashion_app/ui/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  Product product;
  ProductDetails(this.product);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppbar(
        title: product.name,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height / 3,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color:Colors.black12 ,
                    blurRadius:10 ,
                    spreadRadius: 6,
                    offset: Offset(0,1)
                  )
                ],
                image: DecorationImage(
                  image: NetworkImage(
                    product.imageUrl,
                  ),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(product.name,style: titleStyle.copyWith(fontWeight: FontWeight.w900),),
                   Text('${product.price} \$',style: titleStyle.copyWith(fontSize: 17,color: Colors.amber)),

                   ],
                 ),
            Text(product.description,style: titleStyle.copyWith(fontSize: 14,color: brownColor),),

                ],
              ),
            )
          ],
        ),
      ),
    );  }
}
