import 'package:fashion_app/contstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: pinkColor,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 28,
                  color: Colors.white,
                )),
          ),
        ],
        title: Text(
          'تفاصيل المنتجات',
          style: titleStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/769659/pexels-photo-769659.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق',
                  style: titleStyle.copyWith(fontSize: 12, color: brownColor)),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              margin:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 2),
              width: MediaQuery.of(context).size.width / 3,
              height: 40,
              decoration: BoxDecoration(
                  color: pinkColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/image/face.png',
                    width: 22,
                    height: 22,
                    color: brownColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Image.asset(
                      'assets/image/insta.png',
                      width: 22,
                      height: 22,
                      color: brownColor,
                    ),
                  ),
                  Image.asset(
                    'assets/image/twitter.png',
                    width: 22,
                    height: 22,
                    color: brownColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
