import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/contstant.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: 'About Us',
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40, bottom: 20),
        child: ListView(
          children: [
            Center(
              child: Image.asset('assets/image/logo.png'),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق',
                  style: titleStyle.copyWith(fontSize: 12, color: brownColor)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ],
        ),
      ),
    );
  }
}
