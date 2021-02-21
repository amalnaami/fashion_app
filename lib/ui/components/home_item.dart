import 'package:fashion_app/contstant.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class HomeItems extends StatelessWidget {
  String image;
  String name;
  String price;
  Function action;
  HomeItems({this.name,this.image,this.action,this.price});
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: action,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200],
                spreadRadius: .05,
                blurRadius: 4,
                offset: Offset(0, 0.05), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white),
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                      image: NetworkImage(
                          image),
                      fit: BoxFit.cover)),
            ),
            Container(
                margin: EdgeInsets.only(right: 30,left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(translator.translate( name),style: titleStyle.copyWith(color: pinkColor,fontSize: 17),),
                    Text(translator.translate( price),style: titleStyle.copyWith(color: brownColor,fontSize: 14),),
                  ],
                ))


          ],
        ),
      ),
    );
  }
}
