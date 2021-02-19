import 'package:fashion_app/contstant.dart';
import 'package:flutter/material.dart';

class CallUsItem extends StatelessWidget {
  String name;
  CallUsItem({this.name});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            spreadRadius: .05,
            blurRadius: 4,
            offset: Offset(0, 0.05), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(10),

      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText:name,
            hintStyle: titleStyle.copyWith(
                fontSize: 12, color: Colors.black45,fontWeight: FontWeight.normal)),
      ),
    );
  }
}
