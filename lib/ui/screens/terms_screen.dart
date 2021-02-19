import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/ui/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: CustomAppbar(
        title:'Terms and conditions' ,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: ListView(
          children: [
            Center(
              child: Image.asset('assets/image/logo.png'),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق',
                  style:titleStyle.copyWith(fontSize: 12,color: brownColor)
              ),
            ),

          ],
        ),
      ),
    );
  }
}
