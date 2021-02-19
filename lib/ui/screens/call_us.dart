import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/ui/components/custom_appbar.dart';
import 'package:fashion_app/ui/components/store_item.dart';
import 'file:///C:/Users/AMEL/IdeaProjects/fashion_app/lib/ui/screens/ui_used/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CallUsScreen extends StatefulWidget {
  @override
  _CallUsScreenState createState() => _CallUsScreenState();
}

class _CallUsScreenState extends State<CallUsScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 411.42857142857144,
        height: 683.4285714285714,
        allowFontScaling: true);
    return Scaffold(

      appBar: CustomAppbar(
        title:'Call us' ,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 20.w),

        child:  Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 40, top: 20),
                    child: Text(
                      translator.translate('Contact us'),
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

                  Container(
                    margin: EdgeInsets.only(top: 20,bottom: 10),
                      child: Text( translator.translate('Message content'),style: titleStyle.copyWith(fontSize: 14),)),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 150,
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
                      maxLines: 6,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:'',
                          hintStyle: titleStyle.copyWith(
                              fontSize: 12, color: Colors.black45,fontWeight: FontWeight.normal)),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: pinkColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(translator.translate('Send'),style: titleStyle.copyWith(color: Colors.white),),
                ),
              ),

            ],
          ),
      ),

    );
  }
}
