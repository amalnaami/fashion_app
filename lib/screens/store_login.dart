import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/components/store_item.dart';
import 'package:fashion_app/contstant.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'home_screen.dart';


class StoreLogin extends StatefulWidget {
  @override
  _StoreLoginState createState() => _StoreLoginState();
}

class _StoreLoginState extends State<StoreLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppbar(
        title:'Store registration' ,
      ),


      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height - 120,
          margin: EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 40, top: 20),
                child: Text(
                  translator.translate('You can register your store from here'),
                  style: titleStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ),
              TextItems(
                name: 'User name',
              ),
              TextItems(
                name: 'email',
              ),
              TextItems(
                name: 'pass',
              ),
              TextItems(
                name: 'Company activity',
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen()));
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: pinkColor,
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              alignment: Alignment.center,
              child: Text(translator.translate('Register'),
                  style: titleStyle.copyWith(color: Colors.white),),
          ),
        ),

        ],
      ),
    ),)
    ,
    );
  }
}
