
import 'package:fashion_app/contstant.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  CustomAppbar({this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  AppBar(
    centerTitle: true,
    automaticallyImplyLeading: true,
    backgroundColor: pinkColor,
    title: Text(
    translator.translate(title),
    style: titleStyle.copyWith(color: Colors.white),
    ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}